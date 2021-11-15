Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#index'
      get 'backgrounds', to: 'backgrounds#index'

      resources :sessions, only: :create
      resources :users, only: :create
    end
  end
end
