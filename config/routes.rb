Rails.application.routes.draw do

  root 'profiles#index'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      # searchアクションへのパス

      # 検索フォーム以外からのアクセスはGETになるため、GETでもPOSTでも表示できるようにルーティングを設定
      match 'search' => 'users#search', via: [:get, :post], as: :search

      get 'vr'
      get 'rule'
      get 'privacy'
    end
    resources :comments, only: [:create, :show, :update] do
      post 'reply'
    end
  end
  resources :profiles do
    patch 'color'
    get 'pass'
  end

  post "users/show" => "users#show"


end
