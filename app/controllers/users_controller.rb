class UsersController < ApplicationController
  before_action :must_log_in, only: [:show, :update]
  before_action :current_user, only: [:new, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
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
