Rails.application.routes.draw do

  root 'home#index'

  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
end
