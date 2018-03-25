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

  get 'rankings/like', to: 'rankings#like'
  
  resources :toppages, only: [:index] do
    collection do 
      get :name_a
      get :name_ka
      get :name_sa
      get :name_ta
      get :name_na
      get :name_ha
      get :name_ma
      get :name_ya
      get :name_ra
      get :name_wa
    end
  end
  resources :users, only: [:show, :new, :create] 
  resources :administrators, only: [:new, :create]
  resources :idols, only:[:index, :show, :edit, :update, :new, :create, :destroy]
  resources :thoughts, only:[:create, :destroy]
  resources :inquiries, only: [:index, :show, :new, :create, :destroy]
  
end
