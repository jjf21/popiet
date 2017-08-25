class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlists_places, dependent: :destroy
  has_many :places, through: :wishlists_places
  validates_uniqueness_of :name, scope: :user_id

  def has?(place_id)
    value = false
    self.wishlists_places.each do |wish_place|
      if wish_place.place_id == place_id
        value = true
      end
    end
    return value
  end
end
