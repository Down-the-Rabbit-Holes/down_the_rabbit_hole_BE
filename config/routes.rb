Rails.application.routes.draw do
  resources :animals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/api/v1/animals", to: "api/v1/animals#index"
  get "/api/v1/animals/:id", to: "api/v1/animals#show"
  get "/api/v1/users/:user_id/user_favorites", to: "api/v1/user_favorites#index"
  post "/api/v1/users/:user_id/user_favorites",  to: "api/v1/user_favorites#create"
  delete "/api/v1/users/:user_id/user_favorites/:animal_id", to: "api/v1/user_favorites#destroy"
end
