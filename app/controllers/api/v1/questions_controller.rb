class Api::V1::QuestionsController < ApplicationController

  before_action :authenticate_key 

  
  def index
    render json: Question.all 
  end

  def show
    render json: Question.find(params[:id])
  end

  def edit

  end

  def create
    @question = Question.create(question_params)
    render json: @question 
  end

  def update
    @users_key = request.headers['api_key'] #params[:api_key]
    # match the user's api key
    # ActiveRecord Model.query(:api_key => @users_key)
    # if match, awesme do stuff
    # else 403

    @question = Question.find(params[:id])
    render json: @question.update(question_params)
  end

  private
    def question_params
      params.permit(:title, :answer, :rating, :category, :id)
    end 

    def authenticate_key
      #api_key = request.headers['X-Api-Key']

      #head status: 403 unless User.exists?(:api_key => api_key)
    end 

end
