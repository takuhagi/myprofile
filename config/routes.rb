Rails.application.routes.draw do

  root 'profiles#index'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      # searchアクションへのパス
      get 'search'
      get 'vr'
    end
    resources :comments, only: [:create, :show, :update] do
      post 'reply'
    end
  end
  resources :profiles do
    patch 'color'
  end
  


end
