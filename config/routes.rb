Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items  do
    resources :plans, only: %i[edit update show new create destroy]
    resources :manages, only: %i[edit update show new create destroy]
    collection do
      get 'search'
    end
  end

  
end
