class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  mount_uploader :image, ImageUploader

  has_one :shipping_address
  accepts_nested_attributes_for :shipping_address
  has_many :items, through: :receipt, dependent: :destroy
  has_many :receipts

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}
  validates :first_name,              presence: true
  validates :family_name,             presence: true
  validates :first_name_kana,         presence: true
  validates :family_name_kana,        presence: true
  validates :birthday,                presence: true
  validates :phone_number,            presence: true, length: {maximum: 10}
end