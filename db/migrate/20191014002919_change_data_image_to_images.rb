class ChangeDataImageToImages < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :image, :text
  end
end
