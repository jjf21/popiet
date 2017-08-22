class PlacesController < ApplicationController
  
  def index
    @places = policy_scope(Place)
  end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @reviews = @place.reviews
  end
end
