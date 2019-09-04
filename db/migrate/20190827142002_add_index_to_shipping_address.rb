class AddIndexToShippingAddress < ActiveRecord::Migration[5.2]
  def change
    add_index :shipping_addresses, :user_id
  end
end
