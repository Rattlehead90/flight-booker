class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.city, a.id ] }
    @dates = Flight.pluck(:start_datetime).uniq
                   .map { |d| [ d.strftime("%d/%m/%Y"), d ] }
    
    @flights = Flight.where(
      departure_airport: params[:departure_airport_id],
      arrival_airport: params[:arrival_airport_id],
      start_datetime: params[:start_datetime]
    )
  end

end
