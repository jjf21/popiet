class PlacesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @wishlist = Wishlist.new
    @places = policy_scope(Place)

    @start_month = params["start_month"].to_i
    @end_month = params["end_month"].to_i
    
    @places = Place.where.not(latitude: nil, longitude: nil)
    if @start_month == 0 && @end_month == 0 
      @places
    else
      @places = @places.sort_by {|place| place.stat_avg_score(@start_month, @end_month) }.reverse
    end

    @places = Kaminari.paginate_array(@places).page(params[:page]).per(10)

    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow render_to_string(partial: "places/place_infos", locals: {place: place })
    end
  end

  def show
    @wishlist = Wishlist.new
    @place = Place.find(params[:id])
    authorize @place


    @place = @place.place_with_data


    @place.w_icon = @place.get_icon_class(@place.w_icon)
    @review = Review.new
    @reviews = @place.reviews

     @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
  end
end
end
