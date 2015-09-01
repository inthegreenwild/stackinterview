class UsersController < ApplicationController
  before_action :authorize, only: :home
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

  def home 
    @user = User.find(session[:user_id])
    @key = @user.api_key
  end 

  private 
  	def user_params
  		params.require(:user).permit(:name, :email, :password)
  	end 
end
