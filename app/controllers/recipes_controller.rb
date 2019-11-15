class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to @recipe
      else
        render :new
      end
  end

  private 

  def recipe_params
    params.require(:recipe).permit( :title, ingredients_attributes: [:id, :name, :quantity] )
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
