Rails.application.routes.draw do
  root "recipes#index"  # set the homepage to index action
  get "random_recipe", to: "recipes#random"  # route for random action
  resources :recipes
end
