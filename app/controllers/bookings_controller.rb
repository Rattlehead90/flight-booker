class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @passengers_num = params[:passengers][:passengers_num].to_i
    @flight_id = params[:flight]
    @passengers_num.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
  end

  private 
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :last_name, :email, :passport_num])
    end
end
