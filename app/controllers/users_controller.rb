class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:admin] == 1 
      @user.admin = true 
    end
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      render :new 
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end

end
