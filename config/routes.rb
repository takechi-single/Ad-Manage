Rails.application.routes.draw do
  devise_for :users
  root to: 'manages#index'
  resources :users, only: %i[edit update show, new, create, index]
  resources :items, only: %i[index new create show] 
  resources :manages, only: %i[index  show new] 
end
