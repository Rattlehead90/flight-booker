class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.city, a.id] }
    @dates = Flight.pluck(:start_date).uniq
                   .map { |d| [d.strftime('%d/%m/%Y'), d] }
    @flight = Flight.new

    @flights = Flight.where(search_params) unless params[:flight].nil?
  end

  private

    def search_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start_date)
    end
end
