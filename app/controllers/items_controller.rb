class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :item_id, only: [:edit, :show, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_new_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end


  def show
    item_id
  end

  def edit
    item_id
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    item_id
    if @item.update(item_new_params)
      redirect_to item_path
    end
  end


  private

  def item_image_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end

  def item_new_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :prefecture_id, :shipment_term_id, :price, :shipment_fee_id).merge(user_id: current_user.id)
  end

  def item_id
    @item = Item.find(params[:id])
  end
end
