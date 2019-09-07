class AddIndexToCard < ActiveRecord::Migration[5.2]
  def change
    add_index :cards, :user_id
  end
end