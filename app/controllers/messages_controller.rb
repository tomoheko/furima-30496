class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    @item = Item.find(params[:item_id])
    redirect_to item_path(@item)
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end