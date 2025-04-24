Rails.application.routes.draw do
  root 'home#index'
  
  # Routes pour l'authentification
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # Routes pour les équipes
  resources :teams
  
  # Routes spécifiques pour les joueurs (avec contrainte sur l'ID)
  get 'players', to: 'players#index', as: 'players'
  get 'players/new', to: 'players#new', as: 'new_player'
  post 'players', to: 'players#create'
  get 'players/:id', to: 'players#show', as: 'player', constraints: { id: /\d+/ }
  get 'players/:id/edit', to: 'players#edit', as: 'edit_player', constraints: { id: /\d+/ }
  patch 'players/:id', to: 'players#update', constraints: { id: /\d+/ }
  put 'players/:id', to: 'players#update', constraints: { id: /\d+/ }
  delete 'players/:id', to: 'players#destroy', constraints: { id: /\d+/ }
  
  # Ajouter une route spécifique pour créer un joueur à partir d'une équipe
  get 'teams/:team_id/players/new', to: 'players#new', as: 'new_team_player'
  
  resources :matches
end