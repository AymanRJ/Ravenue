class VenuesController < ApplicationController
  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venues_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  private

  def venues_params
    params.require(:venue).permit(:title, :location, :capacity, :price)
  end
end
