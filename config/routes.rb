Rails.application.routes.draw do
  use_doorkeeper

  resources :users, only: [:create]

end
