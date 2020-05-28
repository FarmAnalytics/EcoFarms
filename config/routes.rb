Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/farms_layout', to: 'pages#farms_layout'
  get '/dashboard_layout', to: 'pages#dashboard_layout'

  resources :farms do
    resources :claps, only: [ :create ]
    resources :scorings, only: [ :create ]
  end
  
  resources :likes, only: [ :create ]
  
  resources :users, only: [ :show, :edit ] do
    resources :lists
  end

  resources :shops, only: [ :show, :edit ]

end
