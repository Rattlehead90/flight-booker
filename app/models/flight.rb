class Flight < ApplicationRecord
  # Validations for the seeding of the database
  validates :arrival_airport_id, presence: true
  validates :departure_airport_id, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true

  validate :check_arrival_and_departure

  def check_arrival_and_departure
    errors.add(:arrival_airport_id, "can't be the same as the departure") if self.arrival_airport == self.departure_airport
  end

  # Associations
  belongs_to :departure_airport, class_name: 'Airport',
                                 foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport',
                               foreign_key: 'arrival_airport_id'

  # Querying logic

end
