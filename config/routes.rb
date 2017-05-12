Rails.application.routes.draw do
  devise_for :users
  root 'root#index'
  resources :users, only: [:show]
end
