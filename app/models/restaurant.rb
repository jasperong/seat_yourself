class Restaurant < ActiveRecord::Base
  validates :name, :logo_url, :site_url, :location, :capacity, presence: true
  validates :capacity, numericality: {only_integer: true}

  has_many :reservations
  has_many :users, through: :reservations
end
