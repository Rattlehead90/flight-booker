require "test_helper"

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = Flight.new(arrival_airport: Airport.first, departure_airport: Airport.second, 
                         start_datetime: '11/11/1111 11:11', duration: '04:00')
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

  test 'should not have identical departure and arrival airport' do
    @flight.arrival_airport_id = 2
    @flight.departure_airport_id = 2
    assert_not @flight.valid?
  end
end
