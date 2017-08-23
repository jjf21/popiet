class PlacesController < ApplicationController

  def index
    @places = policy_scope(Place)

    @places = Place.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  end
end

  def show
    @place = Place.find(params[:id])
    authorize @place
    @reviews = @place.reviews
  end
end
