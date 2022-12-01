class Airport < ApplicationRecord
  VALID_CODE = /[A-Z]{3}/
  validates :code, presence: true, length: { is: 3 },
                   format: VALID_CODE, uniqueness: true
end
