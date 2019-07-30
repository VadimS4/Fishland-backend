Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :favorites, only: [:create, :index]
      resources :fish, only: [:index, :show]

      post '/new', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      get '/fish', to: 'fish#index'
      get '/fish/:id', to: 'fish#show'
      
      post '/newfav', to: 'favorites#create'
      post '/unfav', to: 'favorites#destroy'
    end
  end
end
