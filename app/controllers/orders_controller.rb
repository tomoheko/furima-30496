class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @user_order = UserOrder.new
    if @item.order != nil
      redirect_to root_path
    else
      if @item.user == current_user
        redirect_to root_path
      end
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  # 全てのストロングパラメーターを1つに統合
  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :building, :home_number, :phone_number)
    .merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end