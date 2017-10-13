Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#root'
  resources :users do
  	collection { post :import }
  end
  get '/import' => 'sessions#import'
  post '/sessions' => 'sessions#new'
  post '/recover' => 'users#recover'
end
