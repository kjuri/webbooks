class BooksController < ApplicationController
  layout :choose_layout

  def index
    authorize! :index, Book
    @books = Book.accessible_by(current_ability).decorate
  end

  def show
    book
    authorize! :show, @book
    @chapters = book.chapters.decorate
  end

  def new
    @book = new_book_form
    authorize! :create, Book
  end

  def browse
    authorize! :browse, Book
    @books = {
      best: Book.best(12).decorate,
      latest: Book.order(created_at: :desc).limit(12).decorate
    }
  end

  def search
    authorize! :browse, Book
    @books = Book.search(params[:query]).decorate
  end

  def read
    authorize! :read_book, book
    @part ||= if params[:part_id]
      register_progress
      Part.find(params[:part_id])
    elsif progress.any?
      progress.first.part
    elsif book.chapters.first.parts.any?
      book.chapters.first.parts.first
    else
      flash[:alert] = 'This book has no content defined'
      redirect_to browse_books_path
    end
  end

  def create
    @book = new_book_form
    authorize! :create, Book
    if @book.validate(params[:book])
      @book.save do |data|
        @book = Book.create(data)
        flash[:notice] = 'Book successfully created'
        redirect_to book_path(@book.id)
      end
    else
      render :new
    end
  end

  def edit
    authorize! :update, book
    @book = edit_book_form
  end

  def update
    authorize! :update, book
    @book = edit_book_form
    if @book.validate(params[:book])
      @book = @book.sync
      @book.save
      flash[:notice] = 'Book successfully updated'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, book
    if book.destroy
      flash[:notice] = 'Book successfully deleted'
      redirect_to books_path
    end
  end

  private

  def choose_layout
    return 'webbook' if action_name == 'read'
    'application'
  end

  def register_progress
    create_progress and return unless progress.any?
    progress.first.update_attributes(last_activity: Time.now, part_id: params[:part_id])
  end

  def create_progress
    Progress.create(
      last_activity: Time.now,
      book: book,
      part_id: params[:part_id],
      user: current_user
    )
  end

  def book
    @book ||= Book.find(params[:id])
  end

  def progress
    @progress ||= book.progresses.where(user: current_user)
  end

  helper_method :book

  def new_book_form
    BookForm.new(Book.new(user: current_user))
  end

  def edit_book_form
    BookForm.new(book)
  end
end
