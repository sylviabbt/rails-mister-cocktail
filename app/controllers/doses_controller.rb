class DosesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private

  def set_ingredient
    @ingredients = Ingredient.all
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
