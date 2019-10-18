class ItemsController < ApplicationController
 before_action :authenticate_user!, except: :index
 before_action :get_item, only: [:edit, :update]
 
  def index
  end

  def new
    @item = Item.new
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
    @children = Category.find(params[:parent_id]).children
    @sizing = Category.find(params[:parent_id]).size_flag
    @size = Size.where(category_flag:@sizing)
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: { categories: @children, sizes: @size } }
    end
  end

  def brand_suggestions
    @brand = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

private
  def get_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :condition,
      :shipping_charge,
      :delivery_method,
      :delivery_source_area,
      :delivery_days,
      :evaluation,
      :brand_id,
      :size_id,
      :ancestor_category,
      :parent_category,
      :category_id,
      images_attributes: [:image]
    ).merge(user_id: current_user.id)
  end
  def update_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :condition,
      :shipping_charge,
      :delivery_method,
      :delivery_source_area,
      :delivery_days,
      :evaluation,
      :brand_id,
      :size_id,
      :ancestor_category,
      :parent_category,
      :category_id,
      images_attributes: [:image,:id,:_destroy]
    ).merge(user_id: current_user.id)
  end
end