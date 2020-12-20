Rails.application.routes.draw do
  get 'manages/index'
  root to: "manages#index"
end
