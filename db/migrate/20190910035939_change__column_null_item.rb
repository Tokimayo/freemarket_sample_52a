class ChangeColumnNullItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :category_id, false

  end
end
