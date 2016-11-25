class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    # @ingredients = @cocktail.ingredients
  end

  def new
    @cocktail = Cocktail.new
    # @dose = Dose.new
    # @dose.cocktail_id = @cocktail.id
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new" # si le cocktail n'est pas cree avec des attributs valides, on est redirigé vers le formulaire de new
    end

  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
