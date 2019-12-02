Rails.application.routes.draw do
  root 'static_pages#home'
  resources :posts, only: [:index, :new, :create]
  devise_for :users, path: '', path_names: { sign_in: 'login', 
                                             sign_out: 'logout', 
                                             password: 'secret', 
                                             confirmation: 'verification', 
                                             unlock: 'unblock', 
                                             registration: '', 
                                             sign_up: 'sign-up' }
  
  # users
  resources :users, only: [:index, :show]
  
  # likes
  resources :likes, only: [:create, :destroy]

  # comments
  resources :comments, only: [:create]
end
