class UserController < ApplicationController
  def new
  end

  def create
    @uuid = SecureRandom.uuid 
  	@user = User.new(user_params)
    @user.api_key = @uuid 
  	if @user.save
  		session[:user_id] = @user.id 
  		redirect_to '/'
  	else 
  		flash[:error] = 'An error has occured :('
  		render 'new'
  	end 
  end

  private 
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end 
end
