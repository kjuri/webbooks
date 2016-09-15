class BooksController < ApplicationController
  def index
    @books = Book.where(user: current_user).decorate
  end

  def show
    book
    @chapters = book.chapters.decorate
  end

  def new
    @book = new_book_form
  end

  def browse
    @books = {
      best: Book.best(12).decorate,
      latest: Book.order(created_at: :desc).limit(12).decorate
    }
  end

  def create
    @book = new_book_form
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
    @book = edit_book_form
  end

  def update
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
    if book.destroy
      flash[:notice] = 'Book successfully deleted'
      redirect_to books_path
    end
  end

  private

  def book
    @book ||= Book.find(params[:id])
  end

  helper_method :book

  def new_book_form
    BookForm.new(Book.new(user: current_user))
  end

  def edit_book_form
    BookForm.new(book)
  end
end
