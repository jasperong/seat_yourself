class ReservationsController < ApplicationController
  def new
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    if @reservation.save
      flash[:notice] = "Reservation successful"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = "Error: Did not work fool."
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:time, :party_size, :notes)
  end
end
