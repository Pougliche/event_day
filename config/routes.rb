Rails.application.routes.draw do
  root to: 'users#new'
  resources :attendances
  resources :events
  resources :users
end
