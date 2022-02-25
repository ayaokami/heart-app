Rails.application.routes.draw do
  devise_for :users
  root to: 'columns#index'
  resources :columns, only: [:index] do
    collection do
      get 'search'
    end
  end

  namespace :admin do
    resources :columns, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :records
end