class Category < ApplicationRecord
  belongs_to :size
  has_many :brands, through: :categories_brands
  has_many :items
  has_ancestry
end
