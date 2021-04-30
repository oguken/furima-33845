require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品の出品' do
    context'商品出品できるとき' do
      it '全ての値が正しく入力できていれば出品できる' do
        expect(@item).to be_valid 
      end
    end

    context'商品出品できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_manualが空では登録できない' do
        @item.item_manual = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item manual can't be blank"
      end


      it 'categoryが空では登録できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'categoryが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end

      it 'item_conditionが空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition is not a number"
      end
      it 'item_conditionが1では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition must be other than 1"
      end

      it 'send_money_burdenが空では登録できない' do
        @item.send_money_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send money burden is not a number"
      end
      it 'send_money_burdenが1では登録できない' do
        @item.send_money_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Send money burden must be other than 1"
      end

      it 'send_areaが空では登録できない' do
        @item.send_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send area is not a number"
      end
      it 'send_areaが1では登録できない' do
        @item.send_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Send area must be other than 1"
      end

      it 'send_daysが空では登録できない' do
        @item.send_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send days is not a number"
      end
      it 'send_daysが1では登録できない' do
        @item.send_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Send days must be other than 1"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceは全角文字では登録できない' do
        @item.price = 'ａａ１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceは半角英数混合では登録できない' do
        @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceは半角英語だけでは登録できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceは299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end
      it 'priceは10,000,000以上では登録できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is out of setting range"
      end

      it 'item_imageが空では登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
