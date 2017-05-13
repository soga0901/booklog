Rails.application.routes.draw do
  devise_for :users
  root 'root#index'
  resources :users, only: [:show, :create] do
    resources :shelves, only: [:create]
    collection do
      get '/:id/profile', to: 'users#profile', as: 'profile'
    end
  end
end
