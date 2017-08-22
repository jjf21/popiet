class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :city
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :country

      t.timestamps
    end
  end
end
