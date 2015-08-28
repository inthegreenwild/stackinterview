Rails.application.routes.draw do

  get 'user/new'

  get 'user/create'

  namespace :api, defaults: {format: 'json'} do 
    namespace :v1 do 
      resources :questions, except: :destroy 
    end 
  end 

end
