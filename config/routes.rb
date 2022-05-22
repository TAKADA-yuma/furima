Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :shipments,only: [:index,:create]

    collection do
      get 'search'
    end

    collection do
      get 'tag_search'
    end
  end
  resources :cards, only: [:new,:create]
  resources :users, only: [:show]
end
