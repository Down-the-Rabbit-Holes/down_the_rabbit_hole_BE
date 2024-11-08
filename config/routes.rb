Rails.application.routes.draw do
  resources :animals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :animals, only: [:index]
      resources :users, only: [:index] do
        resources :user_favorites, only: [:index, :create]
      end
    end
  end
   
  # get "/api/v1/users/:user_id/user_favorites", to: "api/v1/user_favorites#index"
  # post "/api/v1/users/:user_id/user_favorites",  to: "api/v1/user_favorites#create"
  delete "/api/v1/users/:user_id/user_favorites/:animal_id", to: "api/v1/user_favorites#destroy"
end
