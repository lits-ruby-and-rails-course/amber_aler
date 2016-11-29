Rails.application.routes.draw do
  root to: 'emergencies#index'
  devise_for :users
  resources :users
  resources :emergencies, only: [:index, :show, :destroy]
end
