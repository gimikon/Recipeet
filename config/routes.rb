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
  post "favorites/:post_id/create" => "favorites#create"
  post "favorites/:post_id/destroy" => "favorites#destroy"
  get "users/:id/favorites" => "users#favorites"

  resources :users do
   member do
     get :following, :followers
   end
 end

 resources :relationships
end
