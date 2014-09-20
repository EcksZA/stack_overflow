class VotesController < ApplicationController

  def create
    @answer = Answer.find(params[:answer_id])
    @votes = @answer.votes.new(vote_params)
    if @votes.save
      flash[:notice] = "You have voted on this answer!"
      respond_to do |format|
        format.html {redirect_to question_path(@question)}
        format.js
      end
    end
  end
private
  def vote_params
    params.permit(:answer_id, :user_id).merge(:user_id => current_user.id)
  end
end
