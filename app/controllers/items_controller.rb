class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :get_item, only: [:edit, :update]
  
 def itemcard
   @item 
 end  
   helper_method :create_items_list
 
   def index
     @items = Item.all.order("created_at DESC")
   end
 
   def new
     @item = Item.new
     @errors = @item.errors
     10.times { @item.images.build }
     @category = Category.all.order("id ASC").limit(13)
   end
 
   def create
     if brand = Brand.find_by(name: params[:item][:brand_id])
       params[:item][:brand_id] = brand.id
     else
       params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
     end
       @item = Item.new(item_params)
       @item.item_status = 1
     if @item.save
       Receipt.create(item_id: @item.id)
       redirect_to root_path
     else
       @errors = @item.errors
       @item = Item.new
       10.times { @item.images.build }
       @category = Category.all.order("id ASC").limit(13)
       render :new
     end
   end
 
   def edit
     grandchild = @item.category
     child = grandchild.parent
     parent = child.parent
     @category = child.children
     @children = parent.children
     @parent = Category.all.order("id ASC").limit(13)
     @sizing = grandchild.size_flag
     @size = Size.where(category_flag:@sizing)
     (10 - @item.images.size).times{@item.images.build}
   end
 
   def update
     grandchild = @item.category
     child = grandchild.parent
     parent = child.parent
     @category = child.children
     @children = parent.children
     @parent = Category.all.order("id ASC").limit(13)
     @sizing = grandchild.size_flag
     @size = Size.where(category_flag:@sizing)
 
     if brand = Brand.find_by(name: params[:item][:brand_id])
       params[:item][:brand_id] = brand.id
     else
       params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
     end
     if @item.update(update_params)
       redirect_to root_path
     else
       redirect_to edit_item_path
     end
   end

   def search
    @item = Item.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(user_id:current_user.id)
  end

   def ancestry
     @children = Category.find(params[:parent_id]).children
     @sizing = Category.find(params[:parent_id]).size_flag
     @size = Size.where(category_flag:@sizing)
     respond_to do |format|
       format.html { redirect_to :root }
       format.json { render json: { categories: @children, sizes: @size } }
     end
   end
 
   def destroy
     item = Item.find(params[:id])
     item.destroy
     
     redirect_to list_items_users_path
   end
 
   def brand_suggestions
     @brand = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
     respond_to do |format|
       format.html
       format.json
     end
   end
 
   def create_items_list
     
     lst = {}
     lst['レディース/1']             = 0
     lst['メンズ/2']                = 0
     lst['ベビー・キッズ/3']         = 0
     lst['インテリア・住まい・小物/4'] = 0
     lst['本・音楽・ゲーム/5']        = 0
     lst['おもちゃ・ホビー・グッズ/6'] = 0
     lst['コスメ・香水・美容/7']      = 0
     lst['家電・スマホ・カメラ/8']    = 0
     lst['スポーツ・レジャー/9']      = 0
     lst['ハンドメイド/10']           = 0
     lst['チケット/11']              = 0
     lst['自転車・オートバイ/12']      = 0
     lst['その他/13']                = 0
     
     @items.each do |item|
       categories = item.category.ancestry.split("/")
       lst['レディース/1']            += categories[0] == "1" ? 1 : 0
       lst['メンズ/2']                += categories[0] == "2" ? 1 : 0
       lst['ベビー・キッズ/3']         += categories[0] == "3" ? 1 : 0
       lst['インテリア・住まい・小物/4'] += categories[0] == "4" ? 1 : 0
       lst['本・音楽・ゲーム/5']        += categories[0] == "5" ? 1 : 0
       lst['おもちゃ・ホビー・グッズ/6'] += categories[0] == "6" ? 1 : 0
       lst['コスメ・香水・美容/7']      += categories[0] == "7" ? 1 : 0
       lst['家電・スマホ・カメラ/8']    += categories[0] == "8" ? 1 : 0
       lst['スポーツ・レジャー/9']      += categories[0] == "9" ? 1 : 0
       lst['ハンドメイド/10']           += categories[0] == "10" ? 1 : 0
       lst['チケット/11']              += categories[0] == "11" ? 1 : 0
       lst['自転車・オートバイ/12']      += categories[0] == "12" ? 1 : 0
       lst['その他/13']                += categories[0] == "13" ? 1 : 0
     end
 
     newlst = lst.sort_by{ | k, v | v }.reverse
     
     return newlst
 
   end
 
 private
   def get_item
     @item = Item.find(params[:id])
   end
 
   def item_params
     params.require(:item).permit(:name,:description,:price,:condition,:shipping_charge,:delivery_method,:delivery_source_area,:delivery_days,
       :evaluation,:brand_id,:size_id,:ancestor_category,:parent_category,:category_id,images_attributes: [:image]).merge(user_id: current_user.id)
   end
   def update_params
     params.require(:item).permit(:name,:description,:price,:condition,:shipping_charge,:delivery_method,:delivery_source_area,:delivery_days,
       :evaluation,:brand_id,:size_id,:ancestor_category,:parent_category,:category_id,images_attributes: [:image,:id,:_destroy]).merge(user_id: current_user.id)
   end
 end