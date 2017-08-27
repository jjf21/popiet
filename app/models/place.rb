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
    for i in start_month..end_month
      score += self.monthly_ratings.find_by_month_number(i).rating
      count += 1 
    end
    score = score / count.to_f
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
end
