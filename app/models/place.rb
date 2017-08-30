class Place < ApplicationRecord
  attr_accessor :w_summary, :w_temp, :w_wind, :w_cloud_cover, :w_icon
  has_many :monthly_ratings
  has_many :reviews, dependent: :destroy
  has_many :wishlists_places
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  def stat_avg_score(start_month, end_month)
    score = 0
    count = 0
    start_month = start_month.to_i
    end_month = end_month.to_i

    if end_month < start_month
      a = start_month
      start_month = end_month
      end_month = a 
    end

    if start_month == 0 && end_month > 0
      start_month = end_month
    end 

    if start_month > 0 && end_month == 0
      end_month = start_month
    end

    if start_month != 0 && end_month != 0
      for i in start_month.to_i..end_month.to_i
        score += self.monthly_ratings.find_by_month_number(i).rating
        count += 1 
      end
      score = score / count.to_f
    else
      score = 0
    end
  end

  def get_icon_class(icon_tag)
    icon_class = ''
    icon_class = 'wi-day-sunny' if icon_tag == 'clear-day' || icon_tag == 'clear-night'
    icon_class = 'wi-rain' if icon_tag == 'rain'
    icon_class = 'wi-snow' if icon_tag == 'snow' || icon_tag == 'sleet'
    icon_class = 'wi-strong-wind' if icon_tag == 'wind'
    icon_class = 'wi-cloudy' if icon_tag == 'fog' || icon_tag == 'cloudy' || icon_tag == 'partly-cloudy-day' || icon_tag =='partly-cloudy-night'
    icon_class = 'clear-day' if icon_class == ''
    return icon_class
  end

  def place_with_data

    place = self
    url = "https://api.darksky.net/forecast/#{ENV['FORECAST_API_KEY']}/#{place.latitude},#{place.longitude}" 
    data = JSON.parse(RestClient.get(url))

    if data['currently']
      data = data['currently']
      place.w_summary = data['summary']
      place.w_icon = data['icon']
      place.w_temp = (data['temperature'] - 50).round
      place.w_wind = ((data['windSpeed'] * 1.94384) - 5).round
      place.w_cloud_cover = data['cloudCover']
    else # si on ne recupère rien
      place.w_summary = 0
      place.w_temp = 0
      place.w_wind = 0
      place.w_cloud_cover = 0
      place.w_icon = ''
    end
    place
  end
end
