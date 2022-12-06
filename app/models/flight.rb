class Flight < ApplicationRecord
  # Validations for the seeding of the database
  validates :arrival_airport_id, presence: true
  validates :departure_airport_id, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  validate :check_arrival_and_departure

  def check_arrival_and_departure
    if self.arrival_airport == self.departure_airport
      errors.add(:arrival_airport_id, "can't be the same as the departure")
    end
  end

  # Associations
  belongs_to :departure_airport, class_name: 'Airport',
                                 foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport',
                               foreign_key: 'arrival_airport_id'
  has_many :bookings, foreign_key: :flight_id
  has_many :passengers, through: :bookings, source: :passenger

  # Querying logic
end
