class UsersController < ApplicationController
  before_action :must_log_in, only: [:show, :update]
  before_action :current_user, only: [:new, :show, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if session[:user_id] != @user.id
     redirect_to '/'
   end
  end



  private
    def user_params
      params.require(:user).permit(:id, :name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end
end
