require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

    it "is valid  with a data" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shipping_charge" do
      item = build(:item, shipping_charge: nil)
      item.valid?
      expect(item.errors[:shipping_charge]).to include("can't be blank")
    end

    it "is invalid without a delivery_method" do
      item = build(:item, delivery_method: nil)
      item.valid?
      expect(item.errors[:delivery_method]).to include("can't be blank")
    end

    it "is invalid without a delivery_source_area" do
      item = build(:item, delivery_source_area: nil)
      item.valid?
      expect(item.errors[:delivery_source_area]).to include("can't be blank")
    end

    it "is invalid without a delivery_days" do
      item = build(:item, delivery_days: nil)
      item.valid?
      expect(item.errors[:delivery_days]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a item_status" do
      item = build(:item, item_status: nil)
      item.valid?
      expect(item.errors[:item_status]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    it 'is invalid with a name that has more than 41 characters' do
      name = "n" * 41
      item = build(:item, name: name)
      item.valid?
      expect(item.errors[:name][0]).to include("is too long")
    end

    it 'is valid with a name that has less than 40 chatacters' do
      name = "a" * 40
      item = build(:item, name: name)
      item.valid?
      expect(item).to be_valid
    end

    it 'is invalid with a description that has more than 1000 characters' do
      description = "a" * 1001
      item = build(:item, description: description)
      item.valid?
      expect(item.errors[:description][0]).to include("is too long")
    end

    it 'is invalid with a description that has more than 1000 characters' do
      description = "a" * 1000
      item = build(:item, description: description)
      item.valid?
      expect(item).to be_valid
    end
  end
end