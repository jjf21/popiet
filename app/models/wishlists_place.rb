class WishlistsPlace < ApplicationRecord
  belongs_to :place
  belongs_to :wishlist
end
