class Restaurant < ActiveRecord::Base

  validates :name, :logo_url, :site_url, :location, :capacity, :open_hour, :close_hour, presence: true
  validates :capacity, numericality: {only_integer: true}

  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :category

  def available?(party_size, time)
    if party_size != nil
      party_size <= available_capacity(time)
    end
  end

  private
  def available_capacity(time)
    if time != nil
      capacity - reservations.where(time: time.beginning_of_hour..time.end_of_hour).sum(:party_size)
    end
  end
end
