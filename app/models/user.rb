class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {in: 6..72}

  has_many :reservations
  has_many :restaurants, through: :reservations
end
