class AddUserToorder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :user, index:true
    add_foreign_key :orders, :users
  end
end
