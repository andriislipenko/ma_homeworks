Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :posts

  patch 'posts/:post_id/mark', to: 'posts#mark'

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
