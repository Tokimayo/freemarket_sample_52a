class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key:  { to_table: :users }
      t.datetime :purchase_date
      t.timestamps
    end
  end
end
