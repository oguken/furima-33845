class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit] 

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

 def edit
  #if current_user.id == @item.usergned_in? #出品者ではない 
    #redirect_to action: :index #トップページ
  #end
end

def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

private
def item_params
  params.require(:item).permit(:item_image, :item_name, :item_manual, :category_id, :item_condition_id, :send_money_burden_id, :send_area_id, :send_days_id, :price).merge(user_id: current_user.id)
end

def move_to_index
  @item = Item.find(params[:id])
    unless current_user.id == @item.user.id 
      redirect_to root_path
    end
  end
end

