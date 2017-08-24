class PlacesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @wishlist = Wishlist.new
    @places = policy_scope(Place)
    @places = Place.where.not(latitude: nil, longitude: nil)

    start_month = params["start_month"]
    end_month = params["end_month"]
    if start_month.blank? && !end_month.blank?
      start_month = end_month
    end    
    if !start_month.blank? && end_month.blank?
      end_month = start_month
    end
    
    if !start_month.blank? || !end_month.blank? 
      @places = @places.sort_by {|place| place.stat_avg_score(start_month.to_i, end_month.to_i) }.reverse
    end
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @wishlist = Wishlist.new
    @place = Place.find(params[:id])
    authorize @place
    @review = Review.new
    @reviews = @place.reviews

     @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
  end
end
end
