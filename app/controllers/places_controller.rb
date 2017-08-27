class PlacesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @wishlist = Wishlist.new
    @places = policy_scope(Place)
    @places = Place.where.not(latitude: nil, longitude: nil)

    start_month = params["start_month"]
    end_month = params["end_month"]

    if end_month.to_i < start_month.to_i
      a = start_month
      start_month = end_month
      end_month = a 
    end

    @start_month = params["start_month"].to_i
    @end_month = params["end_month"].to_i

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

    url = "https://api.darksky.net/forecast/#{ENV['FORECAST_API_KEY']}/#{@place.latitude},#{@place.longitude}" 
    data = JSON.parse(RestClient.get(url))


    if data['currently']
      data = data['currently']
      @place.w_summary = data['summary']
      @place.w_icon = data['icon']
      @place.w_temp = (data['temperature'] - 47).round
      @place.w_wind = (data['windSpeed'] * 1.94384).round
      @place.w_cloud_cover = data['cloudCover']
    else # si on ne recupère rien
      @place.w_summary = 0
      @place.w_temp = 0
      @place.w_wind = 0
      @place.w_cloud_cover = 0
      @place.w_icon = ''
    end

    @place.w_icon = @place.get_icon_class(@place.w_icon)
    @review = Review.new
    @reviews = @place.reviews

     @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
  end
end
end
