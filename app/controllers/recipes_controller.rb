class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new #set var recipe to recipe.new 
    @recipe.ingredients.build(name: "First Ingredient") #a recipe will have a name space for the first ingredient when made 
    @recipe.ingredients.build(name: "Second Ingredient") #a recipe will have a name space for the first ingredient when made
  end

  def create
    Recipe.create(recipe_params) #create a new recipe with the params hash 
    redirect_to recipes_path #sends to recipe path 
  end

  private #I dont want the user to be able to change this 

  def recipe_params #this is what i dont waht the user to change 
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end 
end

