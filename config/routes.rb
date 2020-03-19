Rails.application.routes.draw do
  #top page routes#========================
  root :to => "home#top"

  resources :posts

  #Log in & sign up & log out routes#========================
  get'/login' => 'session#new'
  post'/login' => 'session#create'
  delete'/login' => 'session#destroy'
  get '/contact' => 'home#contact'
  get  '/about' => 'home#about'
  get '/users/new' => 'users#new'
  #========================#
  resources :posts do
    resources :likes
  end

  resources :users do
   member do
     get :following, :followers
   end
 end

   resources :relationships, only: [:create, :destroy]
end
