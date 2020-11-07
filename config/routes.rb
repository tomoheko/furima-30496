Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only:[:index, :create]
    resources :messages, only: [:new, :create]
  end
end
