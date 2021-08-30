class VenuesController < ApplicationController
  def show
  end

  def new
    @venues = Venue.new
  end

  def create
    @venue = Venue.new(venues_params)
    if list.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  private

  def venues_params
    params.require(:venues).permit(:title, :location, :capacity, :price)
  end
end
