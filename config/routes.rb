Rails.application.routes.draw do

  get 'categories/show'

  root 'restaurants#index'
  resources :restaurants do
    resources :reservations
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
