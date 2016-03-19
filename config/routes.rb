Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  shallow do
    resources :abilities, only: [:index, :show]
    resources :attribute_categories, only: [:index, :show] do
      resources :attributes, only: [:index, :show]
    end
    resources :attributes, only: [:index]
  end
end
