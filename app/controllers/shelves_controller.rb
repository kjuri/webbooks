class ShelvesController < ApplicationController
  def show
    authorize! :show, shelf
  end

  def new
    authorize! :create, Shelf
    @shelf = new_shelf_form
  end

  def create
    authorize! :create, Shelf
    @shelf = new_shelf_form
    if @shelf.validate(params[:shelf])
      @shelf.save do |data|
        @shelf = Shelf.create(data)
        flash[:notice] = 'Shelf successfully created'
        redirect_to shelf_path(@shelf)
      end
    else
      render :new
    end
  end

  def edit
    authorize! :edit, shelf
    @shelf = edit_shelf_form
  end

  def update
    authorize! :edit, shelf
    @shelf = edit_shelf_form
    if @shelf.validate(params[:shelf])
      @shelf = @shelf.sync
      @shelf.save
      flash[:notice] = 'Shelf successfully updated'
      redirect_to shelf_path(@shelf)
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, shelf
    if shelf.destroy
      flash[:notice] = 'Shelf successfully deleted'
      redirect_to root_path
    end
  end

  private

  def shelf
    @shelf ||= Shelf.find(params[:id])
  end

  def new_shelf_form
    ShelfForm.new(Shelf.new(library: current_user.library))
  end

  def edit_shelf_form
    ShelfForm.new(shelf)
  end
end
