Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :farms do
    resources :claps, only: [ :create ]
    resources :scorings, only: [ :create ]
  end
  
  resources :likes, only: [ :create ]
  
  resources :users, only: [ :show ] do
    resources :lists
  end

  # resources :plugs, only: [ :index, :new, :create, :show, :update, :edit, :destroy ] do 
    # resources :bookings, only: [ :new, :create, :update ] 
  # end
end
