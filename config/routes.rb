Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :relationships, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end

  root 'home#index'

end
