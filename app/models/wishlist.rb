class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlists_places
end
