Rails.application.routes.draw do
  devise_for :users
  root to: 'users#new'
  resources :attendances
  resources :events
  resources :users
end
