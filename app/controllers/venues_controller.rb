class VenuesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @venues = policy_scope(Venue)
    @venues = @venues.near(params[:location], 5) if params[:location].present?
    @markers = @venues.geocoded.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude,
        info_window: render_to_string(partial: "info_window", locals: { venue: venue })
      }
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = Booking.new
    authorize @venue
    @bookings = @venue.bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venues_params)
    @venue.user = current_user
    authorize @venue
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  private

  def venues_params
    params.require(:venue).permit(:title, :location, :capacity, :price, photos: [])
  end
end
