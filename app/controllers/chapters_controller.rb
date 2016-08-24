class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.where(book_id: params[:book_id])
  end

  def show
    chapter
  end

  def new
    @chapter = new_chapter_form
  end

  def create
    @chapter = new_chapter_form
    if @chapter.validate(params[:chapter])
      @chapter.save do |data|
        @chapter = Chapter.create(data)
        flash[:notice] = 'Chapter successfully created'
        redirect_to chapter_path(@chapter.id)
      end
    else
      render :new
    end
  end

  def edit
    @chapter = edit_chapter_form
  end

  def update
    @chapter = edit_chapter_form
    if @chapter.validate(params[:chapter])
      @chapter = @chapter.sync
      @chapter.save
      flash[:notice] = 'Book successfully updated'
      redirect_to chapter_path(@chapter.id)
    else
      render :edit
    end
  end

  def destroy
    if chapter.destroy
      flash[:notice] = 'Chapter successfully deleted'
      redirect_to chapters_path(book_id: params[:book_id])
    end
  end

  private

  def chapter
    @chapter ||= Chapter.find(params[:id])
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def new_chapter_form
    ChapterForm.new(Chapter.new(book: book))
  end

  def edit_chapter_form
    ChapterForm.new(chapter)
  end
end
