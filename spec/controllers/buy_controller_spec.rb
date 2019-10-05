require 'rails_helper'

RSpec.describe BuyController, type: :controller do
  let(:user){ create(:user) }
  let(:category){ create(:category) }
  let(:size){ create(:size) }
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe 'GET #show' do
    it "get items" do
      items = create_list(:item, 10)
      get :show
      expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :show
      expect(response).to render_template :show
    end
  end
end