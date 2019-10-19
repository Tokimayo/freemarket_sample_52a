class ChangeDatatypeDeliverySourceAreaOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :delivery_source_area, :integer
  end
 end