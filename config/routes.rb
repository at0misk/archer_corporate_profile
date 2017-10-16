Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#root'
  resources :users do
  	collection { post :import }
  end
  get '/import' => 'sessions#import'
  post '/sessions' => 'sessions#new'
  post '/recover' => 'users#recover'
  get '/admin_dash' => 'admins#dash'
  get '/admins/users/:id' => 'admins#users'
  post '/admins/users/search' => 'admins#users_search'
  get '/admins/users_found' => 'admins#users_found'
  get '/admins/delete_user/:id' => 'admins#delete_user'
end
