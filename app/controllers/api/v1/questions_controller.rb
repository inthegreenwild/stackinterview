class Api::V1::QuestionsController < ApplicationController

  before_action :authorize
  
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
    @question = Question.find(params[:id])
    render json: @question.update(question_params)
  end

  private
    def question_params
      params.permit(:title, :answer, :rating, :category, :id)
    end 
end
