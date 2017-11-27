Rails.application.routes.draw do
  use_doorkeeper
  root 'pages#home'

  # New happens in the front-end
  resources :users, only: [:create] do
  	collection do
  		post :names
  	end
  end

  # Don't need to pass id as in a normal user#show, it's found based on the token passed in
  resource :user, only: [:show]

  resources :sessions, only: [:create]

  # Route for OmniAuth to return info from provider
  get '/auth/:provider/callback', to: 'connections#create'
end
