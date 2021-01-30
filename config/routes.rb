Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: %i[edit update show new create index destroy]
  resources :items  do
    resources :plans
    resources :manages
    collection do
      get 'search'
    end
  end

  
end
