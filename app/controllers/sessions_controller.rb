class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:email])
 		if user && user.authenticate[params[:password]]
 			#save user id inside browser cookie
 			session[:user_id] = user.id
 			redirect_to '/'
 		else
 			@message = "Wrong username and password combination"
 			render 'new'
 		end 
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/login'
  end
end
