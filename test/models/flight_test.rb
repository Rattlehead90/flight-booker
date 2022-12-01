require "test_helper"

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = Flight.new
  end

  test 'should not save flights without departure airports' do
    @flight.departure_airport_id = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without arrival airports' do
    @flight.arrival_airport_id = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without datetime' do
    @flight.start_datetime = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without flight duration' do
    @flight.duration = ''
    assert_not @flight.valid?
  end
end
