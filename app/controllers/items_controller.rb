class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  # before_action :move_to_index, except: [:index, :show]

  def index
    # @items = Item.order("created_at DESC")
  end

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

  def show
    @item = Item.find(params[:id])
  end

  # def edit
  # end

  # def destroy
  # end

  private
  
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def item_image_params
    params.require(:item).permit(:name, :image).merge(user_id: current_user.id)
  end

  def item_new_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :prefecture_id, :shipment_term_id, :price, :shipment_fee_id).merge(user_id: current_user.id)
  end
end
