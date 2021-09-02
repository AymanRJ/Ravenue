class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @venue = Venue.find(params[:venue_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to venue_path(@venue)
    else
      render 'venues/show'
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:event_name, :start_date, :end_date)
  end
end
