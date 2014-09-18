class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'Logged in'
      # Not complete, to be moved to index page
      redirect_to user_path(@user)
    else
      flash.now.alert = 'Login is invalid'
      render 'new'
    end
  end

  def destroy
    reset_session
    # this will be changed to the index page
    flash[:notice] = 'User logged out'
    redirect_to sessions_path
  end
end
