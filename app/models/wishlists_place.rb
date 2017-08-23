class WishlistsPlace < ApplicationRecord
  belongs_to :place
  belongs_to :wishlist
  validates_uniqueness_of :place_id, scope: :wishlist_id
end
