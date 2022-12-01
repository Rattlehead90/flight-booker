class Flight < ApplicationRecord
  validates :arrival_airport_id, presence: true
  validates :departure_airport_id, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true

  belongs_to :departure_airport, class_name: 'Airport',
                                 foreign_key: 'departure_airport_id'
  belongs_to :arrival_airport, class_name: 'Airport',
                               foreign_key: 'arrival_airport_id'
end
