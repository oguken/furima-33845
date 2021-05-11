require 'rails_helper'
RSpec.describe BuySend, type: :model do

  before do
    @buy_send = FactoryBot.build(:buy_send)
  end

  describe '購入内容の確認' do
    context'購入内容を確認できるとき' do
      it '全ての値が正しく入力できていれば保存できる' do
        expect(@buy_send).to be_valid
      end
    end

    context'購入内容の確認ができないとき' do
      it 'postal_codeが空では登録できない' do
        @buy_send.postal_code =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'send_areaが空では登録できない' do
        @buy_send.send_area_id =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Send area can't be blank"
      end
      it 'send_areaが1では登録できない' do
        @buy_send.send_area_id = 1
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "User can't be blank"
      end

      it 'city_townが空では登録できない' do
        @buy_send.city_town =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "City town can't be blank"
      end

      it 'addressが空では登録できない' do
        @buy_send.address =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Address can't be blank"
      end

      it 'building_nameが空では登録できない' do
        @buy_send.building_name =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Building name can't be blank"
      end

      it 'tell_numberが空では登録できない' do
        @buy_send.tell_number =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Tell number can't be blank"
      end

      it "tokenが空では登録できないこと" do
        @buy_send.token = nil
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
