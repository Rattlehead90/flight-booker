class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :passport_num, presence: true 

  belongs_to :booking
  has_many :flights, through: :bookings
end
