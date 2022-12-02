class Airport < ApplicationRecord
  VALID_CODE = /[A-Z]{3}/
  validates :code, presence: true, length: { is: 3 },
                   format: VALID_CODE, uniqueness: true

  has_many :departure_flights, class_name: 'Flight',
                               foreign_key: 'departure_airport_id', 
                               dependent: :destroy

  has_many :arrival_flights, class_name: 'Flight',
                             foreign_key: 'arrival_airport_id',
                             dependent: :destroy
  
end
