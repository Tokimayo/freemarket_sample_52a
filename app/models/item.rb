class Item < ApplicationRecord
  has_many :users, through: :receipt
  has_many :images, dependent: :destroy
  belongs_to :category
  belongs_to :size
  belongs_to :brand

end
