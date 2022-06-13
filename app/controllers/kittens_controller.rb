class KittensController < ApplicationController
  def index
    @kittens = Kitten.all.order(:name)
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to kittens_path
    else
      flash.now[:alert] = 'Save failed.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to kittens_path
    else
      flash.now[:alert] = 'Update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    
    if @kitten.destroy
      redirect_to kittens_path, status: :see_other 
    else
      flash.now[:alert] = 'Delete failed.'
      render :index, status: :unprocessable_entity
    end
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end