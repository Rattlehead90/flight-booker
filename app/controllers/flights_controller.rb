class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.city, a.id ] }
    @dates = Flight.all.select('DISTINCT start_datetime')
                   .map { |f| [ f.start_datetime.strftime("%d/%m/%Y"), f.start_datetime ] }
  end
end
