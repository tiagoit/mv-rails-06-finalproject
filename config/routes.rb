Rails.application.routes.draw do
  root 'static_pages#home'
  resources :posts, only: [:index, :new, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_for :users, path: '', path_names: {
  #    sign_in: 'login', sign_out: 'logout', password: 'secret',
  #    registration: '', sign_up: 'sign-up' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  # users
  resources :users, only: [:index, :show]

  # likes
  resources :likes, only: [:create, :destroy]

  # comments
  resources :comments, only: [:create]

  # friendships
  post "friendships/request/:friend_id", to: 'friendships#request_friendship', as: 'friendship_request'
  post "friendships/accept/:user_id", to: 'friendships#accept_friendship', as: 'friendship_accept'
end
