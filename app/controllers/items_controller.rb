class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to   root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order("created_at ASC")
 end

 def show
  @item = Item.find(params[:id])
 end


  private
  def item_params
    params.require(:item).permit(:item_image, :item_name, :item_manual, :category_id, :item_condition_id, :send_money_burden_id, :send_area_id, :send_days_id, :price).merge(user_id: current_user.id)
  end
end
