Rails.application.routes.draw do

  namespace :api do
  namespace :v1 do
    get 'questions/index'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'questions/show'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'questions/edit'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'questions/create'
    end
  end

  namespace :api do
  namespace :v1 do
    get 'questions/update'
    end
  end

  namespace :api do 
    namespace :v1 do 
      resources :questions, except: :destroy 
    end 
  end 

end
