Rails.application.routes.draw do
  root to: 'items#index'
  get 'users/:id' => 'users#show'
end
