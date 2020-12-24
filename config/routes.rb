Rails.application.routes.draw do
  devise_for :users
  root to: 'manages#index'
  resources :users, only: %i[edit update show]
  resources :items, only: %i[index new create] do
  end
end
