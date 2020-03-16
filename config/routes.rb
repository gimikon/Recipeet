Rails.application.routes.draw do
  #top page routes#========================
  root :to => "home#top"
  get 'top' => 'home#top'
  get 'about' => 'home#about'
  get '/' => 'home#top'
  #========================#

  #Sign up routes#========================
  get '/signup' => "pages#signup"
  #========================#

  #Log in routes#========================
  get'/login' => 'session#new'
  post'/login' => 'session#create'
  delete'/login' => 'session#destroy'
  #========================#


  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get '/users/:id' => 'users#show', :as => :user
  post "users/:id/update" => "users#update"


resources :users
resources :posts




end
