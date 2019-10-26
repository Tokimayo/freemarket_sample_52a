class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :user_id,null: false
      t.string :first_name,null: false
      t.string :family_name,null: false
      t.string :first_name_kana,null: false
      t.string :family_name_kana,null: false
      t.integer :postal_code,null: false
      t.string :prefectures,null: false
      t.string :municipalities,null: false
      t.string :street_number,null: false
      t.string :building_name
      t.string  :phone_number, limit: 11
      t.timestamps
    end
  end
end
