class QuestionsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    current_user = User.find(session[:user_id])
    @question = current_user.questions.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question asked'
      redirect_to question_path(@question)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @question = @user.questions.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @question = @user.questions.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Question updated'
      redirect_to question_path(@question)
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:alert] = 'Question deleted'
    redirect_to user_path(@question.user.id)
  end

private
  def question_params
    params.require(:question).permit(:title, :question, :user_id).merge(user_id: current_user.id )
  end
end
