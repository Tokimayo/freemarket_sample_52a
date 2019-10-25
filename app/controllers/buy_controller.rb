class BuyController < ApplicationController
  require 'payjp'

  def new
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where("(user_id = ?) OR (category_id = ?)", @item.user_id, @item.category_id) 
    @user = User.find(@item.user_id)
    category = @item.category.ancestry.split("/")
    @categories = Category.where("(id = ?) OR (id = ?) OR (id = ?)" , category[0], category[1], @item.category_id)
  end



  def done
    Payjp.api_key = ENV['KEYS']
    Payjp::Charge.create(
      amount: 799,
      card: params['payjp-token'], 
      currency: 'jpy'
    )
    Buy.create(status: 1)
    end
end
    