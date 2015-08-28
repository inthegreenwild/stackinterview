Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'user/new'

  get 'user/create'

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
      resources :questions, except: :destroy 
    end 
  end 

end
