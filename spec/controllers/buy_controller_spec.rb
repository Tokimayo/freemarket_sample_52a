require 'rails_helper'

RSpec.describe BuyController, type: :controller do
  @user = FactoryBot.create(:user)
  @brand = FactoryBot.create(:brand)
  @category = FactoryBot.create(:category)
  @size = FactoryBot.create(:size)
  item = FactoryBot.create(:item, user_id:@user.id, brand_id:@brand.id, category_id:@category.id, size_id:@size.id)

  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe 'GET #show' do
    context "as an authorized user" do
      it "responds successfully" do
        get :show, params: {id: item.id}
        expect(response).to be_success
      end
      
      it "returns a 200 response" do
        get :show, params: {id: item.id}
        expect(response).to have_http_status "200"
      end
    end
  end
end 