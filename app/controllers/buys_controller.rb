class BuysController < ApplicationController


  def index
     @item = Item.find(params[:item_id])
     @buy_send = BuySend.new
  end


  def new
    @buy_send = BuySend.new
  end
 

  def create
    @item = Item.find(params[:item_id])
    @buy_send = BuySend.new(send_params)

    if @buy_send.valid? 
      pay_item
      @buy_send.save
      redirect_to   root_path
    else
      render :index
    end
  end
  
  
  private
  
    def send_params
      params.require(:buy_send).permit(:postal_code, :send_area_id, :city_town, :address, :building_name, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id] , token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: send_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

end
