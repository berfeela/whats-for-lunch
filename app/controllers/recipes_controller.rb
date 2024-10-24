class RecipesController < ApplicationController
  def index
    # Render the main page
  end

  def random
    @recipes = [
      "Matar Paneer", "Palak Paneer", "Paneer Shimla Mirch", "Sarson Saag",
      "Aloo Paalak", "Aloo Gobhi", "Aloo Paratha", "Gobhi Paratha",
      "Mooli Paratha", "Bhindi", "Torayi", "Tinda", "Aaloo Baingan",
      "Aloo Beans", "Arbi", "Aaloo Shimla Mirch", "Matar Mushroom"
    ]

    # Use session to store and retrieve last picks
    session[:last_picks] ||= []

    @random_recipe = pick_unique_recipe
    render plain: @random_recipe
  end

  private

  def pick_unique_recipe
    # Filter out recipes from the last picks
    available_recipes = @recipes - session[:last_picks]

    # If all recipes are exhausted, reset the history
    if available_recipes.empty?
      session[:last_picks] = []
      available_recipes = @recipes
    end

    chosen_recipe = available_recipes.sample

    # Update the session to track last three picks
    session[:last_picks] << chosen_recipe
    session[:last_picks].shift if session[:last_picks].size > 3

    chosen_recipe
  end
end
