class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :state
      t.references :product, foreign_key: true
      t.integer :amount
      t.json :payment

      t.timestamps
    end
  end
end
