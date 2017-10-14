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
      if @attraction.update(attraction_params)
          redirect_to "/attractions/#{@attraction.id}"
      else
          "/attractions/#{@attraction.id}/edit"
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
