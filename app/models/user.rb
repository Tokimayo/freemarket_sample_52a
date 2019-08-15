class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  mount_uploader :image, ImageUploader

  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address

  # has_one :user_addresses, dependent: destroy
  # has_many :items, dependent: destroy
  # has_many :comments, dependent: destroy
end
