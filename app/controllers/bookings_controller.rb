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
      flash[:notice] = "Booking request successfully sent!"
      redirect_to venue_path(@venue)
    else
      @bookings = @venue.booked_dates
      render 'venues/show'
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted!
    authorize @booking
    redirect_to dashboard_pages_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.rejected!
    authorize @booking
    redirect_to dashboard_pages_path
  end

  private

  def booking_params
    params.require(:booking).permit(:event_name, :start_date, :end_date, :status)
  end
end
