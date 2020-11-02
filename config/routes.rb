Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  root 'profiles#index'

  #パスワード再設定用アドレス
  resources :password_resets, only: [:new, :create, :edit, :update]


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users do
    collection do
      # searchアクションへのパス
      get 'search'
    end
    resources :comments, only: [:create, :show, :update] do
      post 'reply'
    end
  end
  resources :profiles do
    patch 'color'
  end
  


end
