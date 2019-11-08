Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attendances, only: [:create, :destroy]
  end
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end


  resources :users, except:[:new, :create]
end
