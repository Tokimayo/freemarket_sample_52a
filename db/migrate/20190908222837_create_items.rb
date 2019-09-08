class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :price, null: false
      t.references :brand, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.string :condition, null: false
      t.string :shipping_charge
      t.string :delivery_method, null: false
      t.string :delivery_source_area, null: false
      t.string :delivery_days, null: false
      t.string :evaluation, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :item_status, null: false
      t.index :name
      t.timestamps
    end
  end
end
