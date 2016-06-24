class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :time, :party_size, presence: true
  validate :is_restaurant_available

  # def reservation_under_capacity
  #   total_size = []
  #   restaurant = Restaurant.find(params[:id])
  #
  #   restaurant.reservations.each do |reservation|
  #     total_size << reservation.party_size
  #   end
  #
  #   if restaurant.capacity < total_size.inject(:+)
  #     errors.add(restaurant: "is overbooked!!")
  #   end
  # end
  def is_restaurant_available
    # restaurant = Restaurant.find(params[:id])
    errors.add(restaurant: "is overbooked foo!!") unless restaurant.available?(party_size, time)
  end
end
