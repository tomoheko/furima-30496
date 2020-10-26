class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:id])
    @order = Order.new
    binding.pry
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render order_path
    end
  end

  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: @item.id)
  end
# end