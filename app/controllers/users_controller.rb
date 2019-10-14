class UsersController < ApplicationController
  def show 
    @username = "ログインしているユーザー"
  end

  def profile
  end

  def list_items
    @items = Item.where("(user_id = ?)", params[:id] )
  end

  def item_detail
    @item = Item.find( params[:id] )
    category = @item.category.ancestry.split("/")
    @categories = Category.where("(id = ?) OR (id = ?) OR (id = ?)" , category[0], category[1], @item.category_id)
  end

  def identification
  end 

  def credit
  end 

  def logout
  end 
  
end   
