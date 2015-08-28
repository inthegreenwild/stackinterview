class Api::V1::QuestionsController < ApplicationController
  respond_to :json 

  def index
    respond_with Question.all 
  end

  def show
    respond_with Question.find(params[:id])
  end

  def edit

  end

  def create
    respond_with Question.create(question_params)
  end

  def update
    respond_with Question.update(question_params)
  end

  private
    def question_params
      params.require(:question).permit(:title, :answer, :rating, :category)
    end 
end
