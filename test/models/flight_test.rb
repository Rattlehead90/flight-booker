require "test_helper"

class FlightTest < ActiveSupport::TestCase
  def setup
    @flight = Flight.new(arrival_airport: Airport.first, departure_airport: Airport.second, 
                         start_date: '11/11/1111', start_time: '11:11', duration: '04:00')
  end

  test 'should not save flights without departure airports' do
    @flight.departure_airport_id = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without arrival airports' do
    @flight.arrival_airport_id = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without date' do
    @flight.start_date = ''
    assert_not @flight.valid?
  end

  test 'should not save flights without time' do
    @flight.start_time = ''
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
