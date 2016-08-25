class ChaptersController < ApplicationController
  def index
    @chapters = Chapter.where(book: book).decorate
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
        redirect_to book_chapter_path(@book, @chapter)
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
      flash[:notice] = 'Chapter successfully updated'
      redirect_to book_chapter_path(@book, @chapter)
    else
      render :edit
    end
  end

  def destroy
    if chapter.destroy
      flash[:notice] = 'Chapter successfully deleted'
      redirect_to book_chapters(book)
    end
  end

  private

  def chapter
    book
    @chapter ||= Chapter.find(params[:id]).decorate
  end

  def book
    @book ||= Book.find(params[:book_id]).decorate
  end

  def new_chapter_form
    ChapterForm.new(Chapter.new(book: book))
  end

  def edit_chapter_form
    ChapterForm.new(chapter)
  end
end
