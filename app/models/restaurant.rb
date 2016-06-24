class Restaurant < ActiveRecord::Base
	validates :name, :logo_url, :site_url, :location, :capacity, :open_hour, :close_hour, :category, presence: true
	validates :capacity, numericality: {only_integer: true}

<<<<<<< HEAD
	has_many :reservations
	has_many :users, through: :reservations
=======
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :categories 

>>>>>>> 1609eb8b245b9cccbf0598259fd655b454085898

	def available?(party_size, time)
		party_size > 0 && party_size <= available_capacity(time)
	end

	private

	def available_capacity(time)
		# capacity - reservations.where(time: time.beginning_of_hour..time.end_of_hour).sum(:party_size)
		# Alternative expression of the time range, also works
		capacity - reservations.where(time: (time > open_time && time < close_time) && (time.beginning_of_hour..time.end_of_hour).sum(:party_size))
	end
end
