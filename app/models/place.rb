class Place < ApplicationRecord
  has_many :monthly_ratings
  has_many :reviews, dependent: :destroy
  has_many :wishlists_places
   geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
