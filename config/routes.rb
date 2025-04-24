Rails.application.routes.draw do
  root 'home#index'
  
  # Routes pour l'authentification
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :teams do
    resources :players, shallow: true
  end
  
  resources :players
  resources :matches
end