Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'users/show'
  devise_for :users
  root to: 'farms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/farms_layout', to: 'pages#farms_layout'
  get '/dashboard_layout', to: 'pages#dashboard_layout'
  get '/farms/:id/count_clap', to: 'farms#count_clap'

  resources :farms do
    resources :claps, only: [ :create ]
    resources :scorings, only: [ :create ]
  end

  resources :likes, only: [ :create ]
  
  # resources :users, only: [ :show, :edit ] do
  #   resources :lists
  # end

  resource :user, only: [:update] do 
      get :profile
      get :messages
      resources :lists, only: [:index, :show]
  end 

  resources :shops, only: [ :show, :edit ]

  resources :lists, only: [ :create, :destroy ]

end
