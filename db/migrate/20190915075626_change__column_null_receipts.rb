class ChangeColumnNullReceipts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :receipts, :buyer_id, true
  end
end
