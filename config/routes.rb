Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to:'sessions#new'
  post 'login',  to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  get 'admin_login', to:'adminsessions#new'
  post 'admin_login',  to:'adminsessions#create'
  delete 'admin_logout', to: 'adminsessions#destroy'
  get 'admin_signup',to: 'administrators#new'  

  resources :users, only: [:show, :new, :create]
  resources :administrators, only: [:new, :create]
  resources :idols, only:[:index, :show, :new, :create, :destroy]
  resources :thoughts, only:[:create, :destroy]
  
end
