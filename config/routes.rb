Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :abilities, only: [:index, :show]
  resources :attribute_categories, only: [:index, :show]
end
