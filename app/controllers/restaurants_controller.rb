class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.build
    @reservations = Reservation.where(restaurant_id: @restaurant.id)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render new_restaurant_path
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :logo_url, :site_url, :phone, :description, :capacity)
  end

end
