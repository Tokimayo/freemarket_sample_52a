require 'rails_helper'

RSpec.describe SignupController, type: :controller do
  describe SignupController do
    describe 'GET #step1' do
      it "renders the :step1 template" do
        get :step1
        expect(response).to render_template :step1
      end
    end

    describe 'GET #step2' do
    it "renders the :step2 template" do
      get :step2
      expect(response).to render_template :step2
      end
    end

    describe 'GET #step3' do
    it "renders the :step3 template" do
      get :step3
      expect(response).to render_template :step3
      end
    end

    describe 'GET #step4' do
    it "renders the :step4 template" do
      get :step4
      expect(response).to render_template :step4
      end
    end

    describe 'GET #done' do
      it "renders the :done template" do
        user = create(:user)
        get :done, session: { id: user.id }
        expect(response).to render_template :done
      end
    end

    describe 'POST #create' do
      it "renders the :done template" do
        user = create(:user)
        get :done, session: { id: user.id }
        expect(response).to render_template :done
      end
    end
    
  end

  # describe 'GET #step2' do
  #   it "assigns the params step1" do
  #     user = build(:user)
  #     get :step2, params: {
  #       nickname:              user.nickname,
  #       email:                 user.email,
  #       password:              user.password,
  #       password_confirmation: user.password_confirmation,
  #       first_name:            user.first_name,
  #       family_name:           user.family_name,
  #       first_name_kana:       user.first_name_kana,
  #       family_name_kana:      user.family_name_kana,
  #       phone_number:          user.phone_number
  #     }
  #     expect(assigns(:user)).to eq user
  #   end



  #   it "renders the :step2 template" do
  #     user = build(:signup)
  #     get :step2, params: {
  #       nickname:              user.nickname,
  #       email:                 user.email,
  #       password:              user.password,
  #       password_confirmation: user.password_confirmation,
  #       first_name:            user.first_name,
  #       family_name:           user.family_name,
  #       first_name_kana:       user.first_name_kana,
  #       family_name_kana:      user.family_name_kana,
  #       phone_number:          user.phone_number
  #     }
  #     expect(response).to render_template :step2
  #   end
  # end

  # describe 'GET #step3' do
  #   it "renders the :step3 template" do
  #     get :step3
  #     expect(response).to render_template :step3
  #   end
  # end

  # describe 'GET #step4' do
  #   it "renders the :step4 template" do
  #     get :step4
  #     expect(response).to render_template :step4
  #   end
  # end

  # describe 'GET #done' do
  #   it "renders the :done template" do
  #     get :done
  #     expect(response).to render_template :done
  #   end
  # end

end