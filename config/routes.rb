Rails.application.routes.draw do
root :to => "pages#welcome"
resources :users, :only => [:new, :create, :index]

get'/login' => 'sessions#new'
post'/login' => 'sessions#create'
delete'/login' => 'sessions#destroy'

end
