class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
  end


  private
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_image_params
    params.require(:item).permit(:name, :image).merge(item_id: current_user.id)
  end
end
