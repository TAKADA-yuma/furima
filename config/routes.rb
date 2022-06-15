Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
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
