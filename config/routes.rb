Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  #resources :users
  get '/:username', to: 'users#show', as: 'user'

  scope ':username' do
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end
    
  resources :relationships, only: [:create, :destroy]
  root 'tweets#index'
end
