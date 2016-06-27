class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :time, :party_size, presence: true
  validate :is_restaurant_available, :is_restaurant_open, :is_party_size_valid

  def is_restaurant_available
    # restaurant = Restaurant.find(params[:id])
    errors.add(:restaurant, "is overbooked foo!!") unless restaurant.available?(party_size, time)
  end

  # Make sure restaurant has open_hour and close_hour
  def is_restaurant_open
    errors.add(:restaurant, "is closed!") unless time > restaurant.open_hour && time < restaurant.close_hour
  end

  def is_party_size_valid
    party_size > 0
  end
end
