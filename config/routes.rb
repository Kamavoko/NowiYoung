Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shops do
    resources :comments, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
    collection do
     get 'search'
   end
  end

  namespace :api do
    resources :shops
    resources :comments
  end

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get 'pages/show'
  get 'pages/index'
end
