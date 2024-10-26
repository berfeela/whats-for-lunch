class RecipesController < ApplicationController
  def index
    # Renders the main page (index.html.erb)
  end

  def random
    @recipes = [
      "Matar Paneer", "Palak Paneer", "Paneer Shimla Mirch", "Sarson Saag",
      "Aloo Paalak", "Aloo Gobhi", "Aloo Paratha", "Gobhi Paratha",
      "Mooli Paratha", "Bhindi", "Torayi", "Tinda", "Aaloo Baingan",
      "Aloo Beans", "Arbi", "Aaloo Shimla Mirch", "Matar Mushroom"
    ]

    session[:last_picks] ||= []
    @random_recipe = pick_unique_recipe

    # Render the result as plain text or as a view
    render plain: @random_recipe  # Or render :random for an HTML view
  end

  private

  def pick_unique_recipe
    available_recipes = @recipes - session[:last_picks]

    if available_recipes.empty?
      session[:last_picks] = []  # Reset if all recipes are used
      available_recipes = @recipes
    end

    chosen_recipe = available_recipes.sample

    session[:last_picks] << chosen_recipe
    session[:last_picks].shift if session[:last_picks].size > 3

    chosen_recipe
  end
end
