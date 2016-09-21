class GenresController < ApplicationController
  def index
    @genres = Genre.includes(:books).order(name: :asc)
  end

  def show
    @books = genre.books.decorate
  end

  private

  def genre
    @genre ||= Genre.find(params[:id])
  end
end
