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


  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nickname,                presence: true, length: {maximum: 20}, on: :validates_step1
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_step1
  validates :password,                presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone, on: :validates_step1
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone, on: :validates_step1
  validates :first_name,              presence: true, on: :validates_step1
  validates :family_name,             presence: true, on: :validates_step1
  validates :first_name_kana,         presence: true, on: :validates_step1
  validates :family_name_kana,        presence: true, on: :validates_step1
  validates :phone_number,            presence: true, length: {maximum: 11}, on: :validates_step2
end