class BooksController < ApplicationController
  def new
    @book = BookForm.new(Book.new)
  end
end
