Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :road_trip, only: :create
      resources :activities, only: :index
      resources :sessions, only: :create
      resources :users, only: :create
    end
  end
end
