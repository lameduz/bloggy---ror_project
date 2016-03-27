Rails.application.routes.draw do
  get 'comments/create'

  #Home Page
  root 'posts#index'

  #Routes pour l'inscription
  post '/users' => 'users#create'
  get '/signup' => 'users#new'

  #Routes pour l'authentification
  post '/login' => 'auth#create'
  get '/login' => 'auth#new'

  #Route pour déconnecter l'utilisateur
  get '/logout' => 'auth#destroy'

  #Routes pour le CRUD articles et commentaires
  resources :posts do
    resources :comments
  end
  #Routes pour le profile
  resources :profiles

  get 'tags/:tag', to: 'posts#index', as: :tag

end
