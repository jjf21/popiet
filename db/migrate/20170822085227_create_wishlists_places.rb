class CreateWishlistsPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :wishlists_places do |t|
      t.references :place, foreign_key: true
      t.references :wishlist, foreign_key: true

      t.timestamps
    end
  end
end
