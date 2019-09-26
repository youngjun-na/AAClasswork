Rails.application.routes.draw do
  # get 'comments/create'
  # get 'comments/destroy'
  # get 'comments/index'
  # # get 'artwork_shares/create'
  # # get 'artwork_shares/destroy'
  # # get 'artworks/index'
  # # get 'artworks/show'
  # # get 'artworks/update'
  # # get 'artworks/destroy'
  # # get 'artworks/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:show, :update, :destroy, :create] do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do
      patch 'fave'
    end
  end
  resources :artwork_shares, only: [:create, :destroy] do
    member do
      patch 'fave'
    end
  end

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:index]
  end

  resources :likes, only: [:create, :destroy]

end
