Rails.application.routes.draw do

  root 'home#index'

  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'

  get 'share', to: 'share#index'
  post 'share', to: 'share#share'
end
