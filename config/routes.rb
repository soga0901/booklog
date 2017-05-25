Rails.application.routes.draw do
  devise_for :users
  root 'root#index'

  resources :users, only: [:show, :profile] do
    resources :shelves, only: [:create]
    collection do
      get '/:id/profile', to: 'users#profile', as: 'profile'
    end
  end

  resources :books, only: [:show] do
    collection do
      get 'search_result'
    end
  end

  resources :book_shelves, only: [:create, :destroy]
  resources :reviews, only: [:create, :edit, :update, :destroy]

end
