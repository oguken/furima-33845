class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_item, only: [:index, :create] 
  before_action :move_to_index, only: [:index, :create] 
  


  def index
     @buy_send = BuySend.new
  end
 

  def create
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

    def set_item
      @item = Item.find(params[:item_id])
    end


    def move_to_index
      if current_user.id == @item.user.id || @item.buy.present?
        # 出品者＝ログインユーザーであるor出品商品＝購入された状態
        redirect_to root_path
      end
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
