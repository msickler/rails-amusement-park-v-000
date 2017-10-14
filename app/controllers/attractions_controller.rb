class AttractionsController < ApplicationController

  def index
    @attractions = Attractions.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to '/'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction = Attraction.update(params[:id], attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to '/'
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    @ride = Ride.new
    @ride.attraction = Attraction.find(params[:id])
    @ride.user = User.find(session[:user_id])
    if flash[:message] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
     redirect_to "/"
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
