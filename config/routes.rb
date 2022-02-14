Rails.application.routes.draw do
  devise_for :users
  root to: 'columns#index'
  resources :columns, only: [:index]
end