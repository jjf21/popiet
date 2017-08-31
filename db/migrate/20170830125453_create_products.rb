class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :price
      t.string :image_link
      t.string :product_link

      t.timestamps
    end
  end
end
