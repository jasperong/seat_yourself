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
    @categories = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.owner_id = current_user.id

    if @restaurant.save
      flash[:notice] = "Restaurant Successfully Created!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Restaurant not created foo!"
      render new_restaurant_path
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      flash[:notice] = "Restaurant Successfully Edited!"
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      flash[:notice] = "Restaurant Successfully Removed! Foo!"
      redirect_to root_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :logo_url, :site_url, :phone, :description, :capacity, :open_hour, :close_hour, :category)
  end


end
