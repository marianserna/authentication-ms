Rails.application.routes.draw do
  use_doorkeeper
  root 'pages#home'

  # new happens in the front-end
  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
