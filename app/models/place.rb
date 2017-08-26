class Place < ApplicationRecord
  attr_accessor :w_summary, :w_temp, :w_wind, :w_cloud_cover
  has_many :monthly_ratings
  has_many :reviews, dependent: :destroy
  has_many :wishlists_places
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
end
