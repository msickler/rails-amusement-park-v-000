class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user && @user.authenticate(params[:user][:password])
      flash[:notice] = "#{@user.name} successfully logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Something went wrong. Please try again!"
      redirect_to 'new_session_path'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


end
