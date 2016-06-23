Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  root 'restaurants#index'
  resources :restaurants, only: :show do
    resources :reservations, only: [:create, :new, :show]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
