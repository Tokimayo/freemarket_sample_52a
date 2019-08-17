class ShippingAddress < ApplicationRecord
  belongs_to :user, optional: true

  validates :user_id,          presence: true, on: :validates_step4
  validates :first_name,       presence: true, on: :validates_step4
  validates :family_name,      presence: true, on: :validates_step4
  validates :first_name_kana,  presence: true, on: :validates_step4
  validates :family_name_kana, presence: true, on: :validates_step4
  validates :postal_code,      presence: true, on: :validates_step4
  validates :prefectures,      presence: true, on: :validates_step4
  validates :municipalities,   presence: true, on: :validates_step4
  validates :street_number,    presence: true, on: :validates_step4

end