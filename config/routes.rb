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
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :buy, only: [:show] do
    collection do
      get 'purchase'
      get 'done'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  scope(path_names: { show: 'mypage'}) do
    resources :users do
      collection do
        get 'mypage/profile',  to: 'users#profile'

        get 'mypage/identification', to: 'users#identification'
        get 'mypage/credit', to: 'users#credit'
        get 'logout',  to: 'users#logout'

      end
    end
  end

  resources :items, only: [:index, :new, :create] do
    collection do
      get 'search'
      get 'brand_suggestions'
    end
  end
end