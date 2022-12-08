class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passengers_num = params[:passengers][:passengers_num].to_i
    @flight_id = params[:flight]
    @passengers_num.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
  end

  def show
  end

  def destroy
  end

  private 
    def booking_params
      params.require(:booking).permit(:flight_id, passenger: [:name, :last_name, :email, :passport_num])
    end
end
