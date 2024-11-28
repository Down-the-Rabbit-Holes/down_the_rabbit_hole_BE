Rails.application.routes.draw do
  resources :animals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/api/v1/animals/:id', to: 'api/v1/animals#show', as: 'animal_details'
  get '/api/v1/animals/:id/relationships', to: 'api/v1/animals#relationships', as: 'animal_relationships'

  get '/api/v1/parks', to: 'api/v1/parks#index', as: 'parks'
  get '/api/v1/parks/:id', to: 'api/v1/parks#show', as: 'park'
  get '/api/v1/park_animals/:id', to: 'api/v1/park_animals#index', as: 'park_animals'
  
  get "/api/v1/users/:user_id/user_favorites", to: "api/v1/user_favorites#index"
  post "/api/v1/users/:user_id/user_favorites",  to: "api/v1/user_favorites#create"
  delete "/api/v1/users/:user_id/user_favorites/:animal_id", to: "api/v1/user_favorites#destroy"

  get "/api/v1/animals/videos", to: "api/v1/videos#show"
end
