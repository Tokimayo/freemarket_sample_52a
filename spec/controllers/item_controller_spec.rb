require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user){ create(:user) }
  let(:category){ create(:category) }
  let(:size){ create(:size) }
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe '#new' do
    context 'log in' do
      before do
        login_user user
        get :new
      end

      context 'login' do
        it 'assigns the requested messsage to @item' do
          expect(assigns(:item)).to be_a_new(Item)
        end
      end
    end
  end

  describe '#create' do
    context 'log in' do
      before do
        login_user user
      end

      context 'create item' do
        subject {
          post :create, params: {
            item:{
              id: "1",
              name: "sample",
              description: "テスト用です",
              price: "1000",
              condition: "新品、未使用",
              shipping_charge: "送料込み(出品者負担)",
              delivery_method: "らくらくメルカリ便",
              delivery_source_area: "北海道",
              delivery_days: "1~2日で発送",
              brand_id: "シャネル",
              size_id: size.id,
              category_id: category.id,
              item_status: "1",
              user_id: user.id,
              images_attributes: {"0":{image: image}}
            }}
          }
        it 'count up brand' do
          expect{ subject }.to change(Brand, :count).by(1)
        end
        it 'count up item' do
          expect{ subject }.to change(Item, :count).by(1)
        end
        it 'count up item' do
          expect{ subject }.to change(Receipt, :count).by(1)
        end
        it 'redirects to root_path' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context 'can not save' do
        subject {
          post :create,params: {
            item:{
              name: "sample",
              description: "テスト用です",
              price: "1000",
              condition: "新品、未使用",
              shipping_charge: "送料込み(出品者負担)",
              delivery_method: "らくらくメルカリ便",
              delivery_source_area: "北海道",
              delivery_days: "1~2日で発送",
              brand_id: 1,
              size_id: "1",
              category_id: "15",
          }}
        }
        it 'does not count up' do
          expect{ subject }.not_to change(Item, :count)
        end
        it 'render new' do
          subject
          expect(response).to render_template :new
        end
      end
    end
    context 'not log in' do
      it 'redirects to new_user_session_path' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  describe 'GET #edit' do
    before do
      login_user user
    end

    it "assigns the requested tweet to @item" do
      create(:category, id:1, ancestry: nil)
      create(:category, id:20, ancestry: "1")
      item = create(:item)
      get :edit,params:{id: item}
      expect(assigns(:item)).to eq item
    end
    it "renders the :edit template" do
      create(:category, id:1, ancestry: nil)
      create(:category, id:20, ancestry: "1")
      item = create(:item)
      get :edit, params: { id: item }
      expect(response).to render_template :edit
    end
  end
  describe "#update" do
    before do
      login_user user
    end
    context "as an authorized user" do
      # 正常に記事を更新できるか？
      it "updates an article" do
        create(:category, id:1, ancestry: nil)
        create(:category, id:20, ancestry: "1")  
        item = create(:item)
        item_params = {
          id: "1",
          name: "test",
          description: "テスト用です",
          price: "3000",
          condition: "新品、未使用",
          shipping_charge: "送料込み(出品者負担)",
          delivery_method: "らくらくメルカリ便",
          delivery_source_area: "北海道",
          delivery_days: "1~2日で発送",
          brand_id: "シャネル",
          size_id: size.id,
          category_id: category.id,
          item_status: "1",
          user_id: user.id,
          images_attributes: {"0":{image: image}}
        }
        patch :update, params: {id: item, item: item_params}
        expect(item.reload.price).to eq 3000
      end
      # 記事を更新した後、更新された記事の詳細ページへリダイレクトするか？
      it "redirects the page to /articles/article.id(1)" do
        create(:category, id:1, ancestry: nil)
        create(:category, id:20, ancestry: "1")  
        item = create(:item)
        item_params = {
          id: "1",
          name: "test",
          description: "テスト用です",
          price: "3000",
          condition: "新品、未使用",
          shipping_charge: "送料込み(出品者負担)",
          delivery_method: "らくらくメルカリ便",
          delivery_source_area: "北海道",
          delivery_days: "1~2日で発送",
          brand_id: "シャネル",
          size_id: size.id,
          category_id: category.id,
          item_status: "1",
          user_id: user.id,
          images_attributes: {"0":{image: image}}
        }
        patch :update, params: {id: item, item: item_params}
        expect(response).to redirect_to root_path
      end
    end
    context "with invalid attributes" do
      # 不正なアトリビュートを含む記事は更新できなくなっているか？
      it "does not update an article" do
        create(:category, id:1, ancestry: nil)
        create(:category, id:20, ancestry: "1")  
        item = create(:item)
        item_params = {
          id: "1",
          name: nil,
          description: "テスト用です",
          price: "3000",
          condition: "新品、未使用",
          shipping_charge: "送料込み(出品者負担)",
          delivery_method: "らくらくメルカリ便",
          delivery_source_area: "北海道",
          delivery_days: "1~2日で発送",
          brand_id: "シャネル",
          size_id: size.id,
          category_id: category.id,
          item_status: "1",
          user_id: user.id,
          images_attributes: {"0":{image: image}}
        }
        patch :update, params: {id: item, item: item_params}
        expect(item.reload.name).to eq "test"
      end
      # 不正な記事を更新しようとすると、再度更新ページへリダイレクトされるか？
      it "redirects the page to item/.id(1)/edit" do
        item = create(:item)
        create(:category, id:1, ancestry: nil)
        create(:category, id:20, ancestry: "1")  
        item_params = {
          id: "1",
          name: nil,
          description: "テスト用です",
          price: "3000",
          condition: "新品、未使用",
          shipping_charge: "送料込み(出品者負担)",
          delivery_method: "らくらくメルカリ便",
          delivery_source_area: "北海道",
          delivery_days: "1~2日で発送",
          brand_id: "シャネル",
          size_id: size.id,
          category_id: category.id,
          item_status: "1",
          user_id: user.id,
          images_attributes: {"0":{image: image}}
        }
        patch :update, params: {id: item, item: item_params}
        expect(response).to redirect_to edit_item_path
        end
    end
  end
end