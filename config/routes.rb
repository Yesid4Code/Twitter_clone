Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  # resources :users#, :path => '/' do end
  root 'home#index'
end
