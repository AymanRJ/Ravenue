class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @my_venues = Venue.where(user: current_user)
    @my_toal_returns = 0
    @my_reservations = current_user.reservations
    @my_bookings = current_user.bookings
    @my_total_bookings = 0
  end
end
