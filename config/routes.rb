Rails.application.routes.draw do

  # get 'home/index'
  root 'home#index'
  get 'inquiry' => 'profiles#inquiry'

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
      get 'intro'
    end
    resources :comments, only: [:create, :show, :update] do
      post 'reply'
    end
    get 'entire'
    patch 'entire_update'
    patch 'entire_delete_priority_number'
  end
  resources :profiles do
    patch 'color'
    get 'pass'
    get 'select'
    get 'selectm'
    get 'selectb'
    patch 'top'
    patch 'middle'
    patch 'bottom'
  end

  resources :cards, only: [:new, :index, :create, :destroy] do
  end

  post "users/show" => "users#show"

  resources :store_profiles
  resources :item_profiles
  resources :service_profiles
  resources :event_profiles

  resources :priority_store_profiles
  resources :priority_item_profiles
  resources :priority_service_profiles
  resources :priority_event_profiles

end
