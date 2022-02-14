Rails.application.routes.draw do
  devise_for :users
  root to: 'columns#index'
  resources :columns, only: [:index]

  namespace :admin do
    resources :columns, only: [:new, :create, :edit, :update, :destroy]
  end
end