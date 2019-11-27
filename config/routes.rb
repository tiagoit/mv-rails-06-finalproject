Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', 
                                             sign_out: 'logout', 
                                             password: 'secret', 
                                             confirmation: 'verification', 
                                             unlock: 'unblock', 
                                             registration: '', 
                                             sign_up: 'sign-up' }
end
