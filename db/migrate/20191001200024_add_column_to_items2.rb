class AddColumnToItems2 < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :ancestor_category, :integer
    add_column :items, :parent_category, :integer
  end
end
