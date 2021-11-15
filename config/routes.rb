Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#index'
      get 'backgrounds', to: 'backgrounds#index'

      resources :road_trip, only: :create
      resources :sessions, only: :create
      resources :users, only: :create
    end
  end
end
