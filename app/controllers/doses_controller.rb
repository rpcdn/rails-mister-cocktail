class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :find_dose, only: [:edit, :update, :destroy]

  # a completer

  def new
    @dose = Dose.new
    # @ingredients = Ingredient.pluck(:name)
    @ingredients = Ingredient.all # sert à pouvoir afficher tous les ingredients dans une liste deroulante sur le formulaire.
  end

  def create
    # ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose = Dose.new(dose_params)
    # @dose.ingredient = ingredient
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new" # si la dose n'est pas creee avec des attributs valides, on est redirigé vers le formulaire de new
    end

  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    # ingredient = Ingredient.find(dose_params[:ingredient_id])
    @dose.update(dose_params)
    # @dose.ingredient = ingredient
    @dose.cocktail = @cocktail
    @dose.save
    # if @dose.save
    #   redirect_to cocktail_path(@cocktail)
    # else
    #   render "new"
    # end
    # @review.update(review_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def find_dose
    @dose = Dose.find(params[:id])
  end
end
