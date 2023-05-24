class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.alpha_name
  end
end