Rails.application.routes.draw do
  root :to => "home#top"
  get 'top' => 'home#top'
  get 'about' => 'home#about'
  get '/' => 'home#top'


  get '/pages/signup' => "pages#signup"

  get'/login' => 'session#new'
  post'/login' => 'session#create'
  delete'/login' => 'session#destroy'

  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'

  get 'users/:id' => 'users#show'


resources :users, :only => [:new, :create, :index]
resources :posts




end
