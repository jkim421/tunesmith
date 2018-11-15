Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"

  resources :users, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :albums, only: [:index, :show]

  namespace :api, default: { format: :json } do
    resource :session, only: [:create, :destroy]
    resources :users, only: [:create]
    resources :artists, only: [:create, :update, :show]
    resources :albums, only: [:create, :update, :show]
    resources :songs, only: [:create, :update]
    resources :user_collection_albums, only: [:create, :index]
    resources :user_follows, only: [:create, :index]
  end

end
