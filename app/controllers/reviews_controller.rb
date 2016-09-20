class ReviewsController < ApplicationController
  def new
    @review = new_review_form
  end

  def create
    @review = new_review_form
    if @review.validate(params[:review])
      @review.save do |data|
        @review = Review.create(data)
        flash[:notice] = 'Review successfully created'
        redirect_to details_book_path(@book)
      end
    else
      render :new
    end
  end

  def edit
    @review = edit_review_form
  end

  def update
    @review = edit_review_form
    if @review.validate(params[:review])
      @review = @review.sync
      @review.save
      flash[:notice] = 'Review successfully updated'
      redirect_to details_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    if review.destroy
      flash[:notice] = 'Review successfully deleted'
      redirect_to details_book_path(book)
    end
  end

  private

  def review
    @review ||= Review.find(params[:id])
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def new_review_form
    ReviewForm.new(Review.new(book: book))
  end

  def edit_review_form
    ReviewForm.new(review)
  end
end
