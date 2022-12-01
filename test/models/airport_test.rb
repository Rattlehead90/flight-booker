require "test_helper"

class AirportTest < ActiveSupport::TestCase
  def setup
    @airport = Airport.new(code: 'XXX')
  end

  test 'code is always present' do
    @airport.code = ''
    assert_not @airport.valid?
  end

  test 'code is 3 letters long all caps' do
    invalid_codes = %w[abcd 123 AnD Ax3 a io 8=*]
    invalid_codes.each do |code|
      @airport.code = code 
      assert_not @airport.valid?, "#{code} should not be valid"
    end
  end

  test 'valid codes are valid' do
    valid_codes = %w[CYX BLN PRG MSC]
    valid_codes.each do |code|
      @airport.code = code
      assert @airport.valid?, "#{code} should be valid"
    end
  end

  test 'codes should be unique' do
    duplicate_airport = @airport.dup
    @airport.save 
    assert_not duplicate_airport.valid?
  end 

end
