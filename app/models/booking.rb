class Booking < ApplicationRecord
  validates :flight_id, presence: true
  validates_associated :passengers

  has_many :passengers
  belongs_to :flight

  accepts_nested_attributes_for :passengers, reject_if: :all_blank

end 
