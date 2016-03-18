Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :abilities, only: [:index, :show, :create, :update, :destroy]
end
