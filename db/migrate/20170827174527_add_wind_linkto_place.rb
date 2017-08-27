class AddWindLinktoPlace < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :windfinder_stat, :string
  end
end
