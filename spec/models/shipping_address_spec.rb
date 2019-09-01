require 'rails_helper'
describe ShippingAddress do
  describe '#create' do

    it "is valid" do
      shipping_address = build(:shipping_address)
      expect(shipping_address).to be_valid
    end

    it "is invalid without a first_name" do
      shipping_address = build(:shipping_address, first_name: "")
      shipping_address.valid?
      expect(shipping_address.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without a family_name" do
      shipping_address = build(:shipping_address, family_name: "")
      shipping_address.valid?
      expect(shipping_address.errors[:family_name]).to include("can't be blank")
    end

    it "is invalid without a first_name_kana" do
      shipping_address = build(:shipping_address, first_name_kana: "")
      shipping_address.valid?
      expect(shipping_address.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without a family_name_kana" do
      shipping_address = build(:shipping_address, family_name_kana: "")
      shipping_address.valid?
      expect(shipping_address.errors[:family_name_kana]).to include("can't be blank")
    end


    it "is invalid without a postal_code" do
      shipping_address = build(:shipping_address, postal_code: "")
      shipping_address.valid?
      expect(shipping_address.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid without a prefectures" do
      shipping_address = build(:shipping_address, prefectures: "")
      shipping_address.valid?
      expect(shipping_address.errors[:prefectures]).to include("can't be blank")
    end

    it "is invalid without a municipalities" do
      shipping_address = build(:shipping_address, municipalities: "")
      shipping_address.valid?
      expect(shipping_address.errors[:municipalities]).to include("can't be blank")
    end

    it "is invalid without a street_number" do
      shipping_address = build(:shipping_address, street_number: "")
      shipping_address.valid?
      expect(shipping_address.errors[:street_number]).to include("can't be blank")
    end

  end
end