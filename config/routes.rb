Rails.application.routes.draw do

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
  end
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :buy do
    member do
      get 'purchase'
      get 'done'
    end
  end

  root to: 'items#index'

  scope(path_names: {}) do
    resources :users, path: 'mypage', only: [:show] do
      collection do
        get 'mypage/profile', to: 'users#profile'
        get 'list_items/:id', to: 'users#list_items', as: 'list_items'
        get 'list_items/item_detail/:id', to: 'users#item_detail', as: 'item_detail'
        get 'mypage/identification', to: 'users#identification'
        get 'mypage/credit', to: 'users#credit'
        get 'logout',  to: 'users#logout'
      end
    end
  end

  resources :items, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'ancestry'
      get 'brand_suggestions'
      get 'search', to: 'items#search'
    end
  end
end