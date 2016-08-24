class BooksController < ApplicationController
  def index
    @books = Book.where(user: current_user).decorate
  end

  def show
    book
  end

  def new
    @book = create_new_form
  end

  def create
    @book = create_new_form
    if @book.validate(params[:book])
      @book.save do |data|
        @book = Book.create(data)
        flash[:notice] = 'Book successfully created'
        redirect_to book_path(@book.id)
      end
    else
      render 'new'
    end
  end

  def edit
    @book = create_edit_form
  end

  def update
    @book = create_edit_form
    if @book.validate(params[:book])
      @book.save do |data|
        flash[:notice] = 'Book successfully updated'
        redirect_to book_path(@book.id)
      end
    else
      render 'edit', book_id: book.id
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

  def create_new_form
    BookForm.new(Book.new(user: current_user))
  end

  def create_edit_form
    BookForm.new(book)
  end
end
