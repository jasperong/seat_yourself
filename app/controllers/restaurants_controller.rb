class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservation = @restaurant.reservations.build
		@reservations = Reservation.where(restaurant_id: @restaurant.id)
	end
end
