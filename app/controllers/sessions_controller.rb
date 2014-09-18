class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in'
      redirect_to user_path(@user)
    else
      flash.now.alert = 'Login is invalid'
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'User logged out'
    redirect_to questions_path
  end
end
