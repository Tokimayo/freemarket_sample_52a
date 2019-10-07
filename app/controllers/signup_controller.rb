class SignupController < ApplicationController

  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3
  before_action :validates_step4, only: :create

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    @user = User.new
  end

  def step4
    @user = User.new
    @user.build_shipping_address
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def validates_step1
    session[:nickname]              = user_params[:nickname]
    session[:first_name]            = user_params[:first_name]
    session[:family_name]           = user_params[:family_name]
    session[:first_name_kana]       = user_params[:first_name_kana]
    session[:family_name_kana]      = user_params[:family_name_kana]
    session[:email]                 = user_params[:email]
    session[:password]              = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:phone_number]          = "8012345678"
    
    if user_params[:"birthday(1i)"] == "" || user_params[:"birthday(2i)"] == "" || user_params[:"birthday(3i)"] == ""
      session[:birthday]            = nil
    else
      session[:birthday]            = user_params[:"birthday(1i)"] + '/' + user_params[:"birthday(2i)"] + '/' + user_params[:"birthday(3i)"]
    end

    user_validate_and_create_instance
    if !@user.valid?()
      @user.birthday = nil
      render '/signup/step1'
    end 
  end

  def validates_step2
    session[:phone_number] = user_params[:phone_number]
    user_validate_and_create_instance
    render '/signup/step2' unless @user.valid?()
  end 

  def validates_step4
    session[:shipping_address_attributes] = user_params[:shipping_address_attributes]
    user_validate_and_create_instance
    @user.build_shipping_address(session[:shipping_address_attributes])
    render '/signup/step4' unless @user.valid?()
  end 

  def create
    user_validate_and_create_instance
    @user.build_shipping_address(session[:shipping_address_attributes])
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to new_card_path
    else
      render '/signup/done'
    end
  end

private

  def user_params
    params.require(:user).permit(
      :nickname,
      :first_name,
      :family_name,
      :first_name_kana,
      :family_name_kana,
      :email,
      :password, 
      :password_confirmation,
      :phone_number,
      :"birthday(1i)",
      :"birthday(2i)",
      :"birthday(3i)",
      shipping_address_attributes: [
        :id,
        :first_name,
        :family_name,
        :first_name_kana,
        :family_name_kana,
        :postal_code,
        :prefectures,
        :municipalities,
        :street_number,
        :building_name,
        :phone_number
      ]
    )
  end

  def user_validate_and_create_instance
    @user = User.new(
      nickname:              session[:nickname],
      first_name:            session[:first_name],
      family_name:           session[:family_name],
      first_name_kana:       session[:first_name_kana],
      family_name_kana:      session[:family_name_kana],
      email:                 session[:email],
      password:              session[:password],
      password_confirmation: session[:password_confirmation],
      birthday:              session[:birthday],
      phone_number:          session[:phone_number]
    )
  end
end