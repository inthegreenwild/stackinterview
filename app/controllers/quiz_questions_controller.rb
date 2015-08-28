class QuizQuestionsController < ApplicationController
  def index
    @questions = Question.all 
    puts @questions 
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
