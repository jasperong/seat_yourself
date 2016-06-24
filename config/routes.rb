Rails.application.routes.draw do

  root 'restaurants#index'
  resources :restaurants do
    resources :reservations
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
