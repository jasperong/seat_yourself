class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :time, :party_size, presence: true
  validates :reservation_under_capacity


  def reservation_under_capacity
    total_size = []
    restaurant = Restaurant.find(params[:id])

    restaurant.reservations.each do |reservation|
      total_size << reservation.party_size
    end

    if restaurant.capacity < total_size
      errors.add(restaurant: "is overbooked!!")
    end
  end


end
