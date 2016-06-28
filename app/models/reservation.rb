class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	validate :is_restaurant_available, :is_restaurant_open, :is_party_size_valid, :is_future
	validates :time, :party_size, presence: true

	def is_restaurant_available
		# restaurant = Restaurant.find(params[:id])
		errors.add(:restaurant, "is overbooked foo!!") unless self.restaurant.available?(party_size, time)
	end

	# Make sure restaurant has open_hour and close_hour
	def is_restaurant_open
		errors.add(:restaurant, "is closed!") unless time.hour >= self.restaurant.open_hour.hour && time.hour < self.restaurant.close_hour.hour
	end

	def is_future
		if time.past?
			errors.add(:restaurant, "is not a time machine!!!!!")
		end
	end

	def is_party_size_valid
		if party_size != nil
			party_size > 0

		end
	end
end
