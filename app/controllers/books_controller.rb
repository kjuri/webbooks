class BooksController < ApplicationController
  def new
    @book = create_new_form
  end

  def create
    @book = create_new_form
    if @book.validate(params[:book])
      @book.save do |data|
        Book.create(data)
        flash[:notice] = 'Book successfully created'
        redirect_to book_path(@book)
      end
    else
      render 'new'
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
