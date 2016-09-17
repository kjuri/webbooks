class DecisionPointsController < ApplicationController
  def new
    decision_point
  end

  def create
    @decision_point = DecisionPoint.new(decision_point_params)
    @decision_point.part = part
    if @decision_point.save
      flash[:notice] = 'Decision Point successfully created'
      redirect_to book_chapter_path(book, chapter)
    else
      render :new
    end
  end

  def edit
    decision_point
  end

  def update
    decision_point.update_attribute(:part, part)
    if decision_point.update_attributes(decision_point_params)
      flash[:notice] = 'Decision Point successfully updated'
      redirect_to book_chapter_path(book, chapter)
    else
      render :edit
    end
  end

  def destroy
    if decision_point.destroy
      flash[:notice] = 'Decision Point successfully deleted'
      redirect_to book_chapter_parts(book, chapter)
    end
  end

  private

  def decision_point
    part and chapter
    @parts = book.parts
    @decision_point ||=
      if params[:id]
        DecisionPoint.find(params[:id])
      else
        DecisionPoint.new(part_id: params[:part_id])
      end
  end

  def part
    @part ||= Part.find(params[:part_id])
  end

  def chapter
    @chapter ||= Chapter.find(params[:chapter_id])
  end

  def book
    @book ||= Book.find(params[:book_id])
  end

  def decision_point_params
    params.require(:decision_point).permit(:question, answers_attributes: [:answer, :part_id])
  end
end
