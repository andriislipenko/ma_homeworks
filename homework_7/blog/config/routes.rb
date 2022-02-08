Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :posts

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
