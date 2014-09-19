class AnswersController < ApplicationController
  before_action :authorize, only: [:new]

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    respond_to do |format|
      format.html { redirect_to question_path(@question.id) }
      format.js
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer submitted'
      respond_to do |format|
        format.html { redirect_to question_path(@question.id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to question_path(@question.id) }
        format.js
    end
  end

private
  def answer_params
    params.require(:answer).permit(:answer, :user_id, :question_id).merge(:user_id => current_user.id)
  end
end
