Rails.application.routes.draw do

  resources :quiz_questions, except: :destroy 

  root to: 'quiz_questions#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/home' => 'users#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
      resources :questions
    end 
  end 

end
