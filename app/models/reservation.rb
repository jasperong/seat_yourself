class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :time, :party_size, presence: true
  validate :is_restaurant_available, :is_restaurant_open, :is_party_size_valid

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
    errors.add(:restaurant, "is overbooked foo!!") unless restaurant.available?(party_size, time)
  end

  # Make sure restaurant has open_hour and close_hour
  def is_restaurant_open
    time > restaurant.open_hour && time < restaurant.close_hour
  end

  def is_party_size_valid
    party_size > 0
  end
end
