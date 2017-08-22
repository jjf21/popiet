class CreateMonthlyRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_ratings do |t|
      t.references :place, foreign_key: true
      t.string :month_number
      t.integer :rating

      t.timestamps
    end
  end
end
