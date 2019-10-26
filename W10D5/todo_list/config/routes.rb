Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do 
    resources :todos, only: [:index, :show, :create, :destroy, :update]
  end
  root to: "static_pages#root"
end
