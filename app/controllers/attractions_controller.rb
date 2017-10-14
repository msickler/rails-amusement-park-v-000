class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to "/attractions/#{@attraction.id}"
    else
      redirect_to "/attractions/new"
    end
  end

  def edit
  end

  def update
     @user = current_user
     if params[:user_id].nil? && current_user.admin?
       @attraction.update(attraction_params)
        flash[:notice] = "#{@attraction.name} has been updated!"
       redirect_to attraction_path(@attraction)
     else @user.height > @attraction.min_height && @user.tickets > @attraction.tickets
       flash[:notice] = "Thanks for riding the #{@attraction.name}!"
         @user.tickets -= @attraction.tickets
         @user.happiness += @attraction.happiness_rating
         @user.nausea += @attraction.nausea_rating
         @user.save
         redirect_to user_path(@user)
     
     end
   end

  private
  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
  end
end
