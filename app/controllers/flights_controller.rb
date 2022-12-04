class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [a.city, a.id] }
    @dates = Flight.pluck(:start_datetime).map { |d| d.to_date }.uniq
                   .map { |d| [d.strftime('%d/%m/%Y'), d] }

    return if params[:flight].nil?

    @flights = Flight.where(search_params)
  end

  private

    def search_params
      params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, params[:start_datetime].to_date.beginning_of_day..params[:start_datetime].to_date.end_of_day)
    end
end
