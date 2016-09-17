class PartsController < ApplicationController
  def index
    @parts = Part.where(chapter: chapter).decorate
  end

  def show
    part
  end

  def new
    @part = new_part_form
  end

  def create
    @part = new_part_form
    if @part.validate(params[:part])
      @part.save do |data|
        @part = Part.create(data)
        flash[:notice] = 'Part successfully created'
        redirect_to new_book_chapter_part_decision_point_path(@book, @chapter, @part)
      end
    else
      render :new
    end
  end

  def edit
    @part = edit_part_form
  end

  def update
    @part = edit_part_form
    if @part.validate(params[:part])
      @part = @part.sync
      @part.save
      flash[:notice] = 'Part successfully updated'
      redirect_to edit_book_chapter_part_decision_point_path(@book, @chapter, @part)
    else
      render :edit
    end
  end

  def destroy
    if part.destroy
      flash[:notice] = 'Part successfully deleted'
      redirect_to book_chapter_parts(book, chapter)
    end
  end

  private

  def part
    chapter
    @part ||= Part.find(params[:id])
  end

  def chapter
    book
    @chapter ||= Chapter.find(params[:chapter_id])
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def new_part_form
    part = Part.new(chapter: chapter)
    PartForm.new(part)
  end

  def edit_part_form
    PartForm.new(part)
  end
end
