class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "First Ingredient")
    @recipe.ingredients.build(name: "Second Ingredient")
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    # Need to find_or_create_by ingredients so we dont duplicate them
    # @recipe = Recipe.find(params[:id])
    # if @recipe.update(recipe_params)
    #   binding.pry
    #   redirect_to @recipe
    # else
    #   render "edit"
    # end
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
      ]
    )
  end

end
