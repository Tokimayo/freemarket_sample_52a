class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:first_name] = user_params[:first_name]
    session[:family_name] = user_params[:family_name]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthday] = user_params[:"birthday(1i)"] + ',' + user_params[:"birthday(2i)"] + ',' +user_params[:"birthday(3i)"]
    @user = User.new
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new
  end

  def step4
    @user = User.new
    @user.build_shipping_address
  end

  def step5
    session[:shipping_address_attributes] = user_params[:shipping_address_attributes]
    @user = User.new
  end 

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      first_name: session[:first_name],
      family_name: session[:family_name],
      first_name_kana: session[:first_name_kana],
      family_name_kana: session[:family_name_kana],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      birthday: session[:birthday],
      phone_number: session[:phone_number]
    )
    @user.build_shipping_address(session[:shipping_address_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
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
      :"birthday(1i)",
      :"birthday(2i)",
      :"birthday(3i)",
      :phone_number,

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
      ]
    )
  end

end
