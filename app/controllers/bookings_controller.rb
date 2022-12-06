class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passenger = Passenger.new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private 
    # def passenger_params
    #   params.require(:passenger).permit(:name, :last_name, :email, :passport_num)
    # end
end
