Rails.application.routes.draw do
  use_doorkeeper

  # new happens in the front-end
  resources :users, only: [:create]

end
