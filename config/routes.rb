Rails.application.routes.draw do

  root 'profiles#index'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :comments, only: [:create, :show, :update]
  end
  resources :profiles
  


end
