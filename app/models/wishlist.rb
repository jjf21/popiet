class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishlists_places
  has_many :places, through: :wishlists_places
  validates_uniqueness_of :name, scope: :user_id
end
