Rails.application.routes.draw do
  use_doorkeeper
  root 'pages#home'

  # New happens in the front-end
  resources :users, only: [:create]

  resource :user, only: [:show]

  resources :sessions, only: [:create]

  # Route for OmniAuth to return info from provider
  get '/auth/:provider/callback', to: 'connections#create'
end
