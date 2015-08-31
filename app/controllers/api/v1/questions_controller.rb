class Api::V1::QuestionsController < ApplicationController

  before_action :authenticate_key
  
  def index
    @vars = request.query_parameters
    @questions = Question.where(nil)

    #implement valid header query filters
    filtering_params(params).each do |key, value|
      @questions = @questions.public_send(key, value) if value.present?
    end    
    
    render json: @questions  
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
    @users_key = params[:api_key] #params[:api_key]
    # match the user's api key
    # ActiveRecord Model.query(:api_key => @users_key)
    # if match, awesme do stuff
    # else 403
    @question = Question.find(params[:id])
    render json: @question.update(question_params)
  end

  private

    def question_params
      params.permit(:title, :answer, :rating, :category, :keyword, :id)
    end 

    def authenticate_key
      api_key = params[:api_key]
      api_keyy = request.headers['X-Api-Key'] 
      puts api_keyy
      puts request.headers 
      head status: 403 unless User.exists?(:api_key => api_keyy)
    end 

    def filtering_params(params)
      params.slice(:category, :keyword, :rating, :min_rating, :title_includes)
    end

end
