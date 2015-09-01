class QuizQuestionsController < ApplicationController
  before_action :authorize 
  def index
    @questions = Question.all 
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end
end
