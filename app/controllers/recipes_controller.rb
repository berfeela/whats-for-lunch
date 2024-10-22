class RecipesController < ApplicationController
  def index
    # render the main page.
  end

    #add your own dishes/favorite foods here
  def random
    @recipes = [
    "Daal Chawal",
    "Aloo Paratha + Fruits",
    "Chicken Chawal",
    "Paneer variety",
    "Paalak variety+ Fruits",
    "Mutton",
    "Egg variety + Fruits "
    ]
    @random_recipe = @recipes.sample
    render plain: @random_recipe
    
  end
end