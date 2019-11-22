class RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
    2.times { @recipe.ingredients.build }
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end
end

private

def recipe_params
  params.require(:recipe).permit( :title, ingredients_attributes: [:id, :name, :quantity] )
end
