Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/me", to: "users#show"
  get "/users", to: "users#index"
  post "/user", to: "users#create"
  post '/login', to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"

  get "/scores", to: "wordle_scores#index"
  post "/scores", to: "wordle_scores#create"
end
