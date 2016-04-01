Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  shallow do
    resources :abilities, only: [:index]
    resources :attribute_categories, only: [:index]
    resources :character_types, only: [:index]

    resources :characters, only: [:index, :show]
  end
end
