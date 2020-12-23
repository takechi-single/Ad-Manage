Rails.application.routes.draw do
  devise_for :users
  get 'manages/index'
  root to: 'manages#index'
  resources :users, only: %i[edit update]
end
