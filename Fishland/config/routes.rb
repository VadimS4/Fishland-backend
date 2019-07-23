Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :favorites, only: [:create, :index]
      resources :fish, only: [:index, :show]

      post '/new', to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
