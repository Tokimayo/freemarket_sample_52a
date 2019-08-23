class ShippingAddress < ApplicationRecord
  belongs_to :user, optional: true

  validates :first_name,       presence: true
  validates :family_name,      presence: true
  validates :first_name_kana,  presence: true
  validates :family_name_kana, presence: true
  validates :postal_code,      presence: true
  validates :prefectures,      presence: true
  validates :municipalities,   presence: true
  validates :street_number,    presence: true

end