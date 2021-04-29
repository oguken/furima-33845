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
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_conditionが空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it 'send_money_burdenが空では登録できない' do
        @item.send_money_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send money burden can't be blank"
      end
      it 'send_areaが空では登録できない' do
        @item.send_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send area can't be blank"
      end
      it 'send_daysが空では登録できない' do
        @item.send_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Send days can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
