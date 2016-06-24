class Restaurant < ActiveRecord::Base
	validates :name, :logo_url, :site_url, :location, :capacity, :open_hour, :close_hour, :category, presence: true
	validates :capacity, numericality: {only_integer: true}

	has_many :reservations
	has_many :users, through: :reservations
	

	def available?(party_size, time)
		party_size <= available_capacity(time)
	end

	def self.categories
		['italian', 'indian', 'american']
	end

	private

	def available_capacity(time)
		# capacity - reservations.where(time: time.beginning_of_hour..time.end_of_hour).sum(:party_size)
		# Alternative expression of the time range, also works
		capacity - reservations.where(time: time.beginning_of_hour..time.end_of_hour).sum(:party_size)
	end
end
