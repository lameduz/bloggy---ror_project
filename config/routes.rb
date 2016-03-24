Rails.application.routes.draw do
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

  #Routes pour le CRUD articles
  resources :posts

  #Routes pour le profile
  resources :profiles

end
