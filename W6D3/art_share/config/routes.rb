Rails.application.routes.draw do
  # get 'artwork_shares/create'
  # get 'artwork_shares/destroy'
  # get 'artworks/index'
  # get 'artworks/show'
  # get 'artworks/update'
  # get 'artworks/destroy'
  # get 'artworks/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only:[:index]
  end
  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]  
end
