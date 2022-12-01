class Flight < ApplicationRecord
  validates :arrival_airport_id, presence: true
  validates :departure_airport_id, presence: true
  validates :start_datetime, presence: true
  validates :duration, presence: true
end
