class ReservationsController < ApplicationController

before_action :load_restaurant
before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @reservation = @restaurant.reservations.build
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      flash[:notice] = "Reservation successful"
      redirect_to restaurant_path(@restaurant)
    else
      @reservation.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
      redirect_to restaurant_path(@restaurant)
    end
  end

  def show
  end

  def edit
    @reservations = Reservation.where(restaurant_id: @restaurant.id)

  end

  def update
    if @reservation.update_attributes(reservation_params)
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to @restaurant
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :party_size, :notes)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

end
