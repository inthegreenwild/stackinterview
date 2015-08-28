Rails.application.routes.draw do

  root to: 'questions#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
      resources :questions, except: :destroy 
    end 
  end 

end
