Rails.application.routes.draw do
  #top page routes#========================
  root :to => "home#top"

  resources :posts
  resources :pages
  #Log in & sign up & log out routes#========================
  get'/login' => 'session#new'
  post'/login' => 'session#create'
  delete'/login' => 'session#destroy'
  get '/contact' => 'pages#contact'
  get  '/about' => 'pages#about'
  get '/users/new' => 'users#new'
  #========================#

  resources :users do
   member do
     get :following, :followers
   end
 end

 resources :relationships
end
