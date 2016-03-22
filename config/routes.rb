Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  concern :anima_effect_owner do
    resources :anima_effects, only: [:index, :show]
  end

  shallow do
    resources :abilities, only: [:index, :show]

    resources :attribute_categories, only: [:index, :show] do
      resources :attributes, only: [:index, :show]
    end
    resources :attributes, only: [:index]

    resources :character_types, only: [:index, :show],
                                concerns: :anima_effect_owner do
      resources :castes, only: [:index, :show], concerns: :anima_effect_owner
    end

    resources :characters, only: [:index, :show]
  end
end
