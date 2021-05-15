require 'rails_helper'
RSpec.describe BuySend, type: :model do

  before do

    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_send = FactoryBot.build(:buy_send, user_id:@user.id, item_id:@item.id)
    sleep 0.1
  end

  describe '購入内容の確認' do
    context'購入内容を確認できるとき' do
      context'建物名が抜けていても登録できること' do
      it '全ての値が正しく入力できていれば保存できる' do
        expect(@buy_send).to be_valid
      end
    end
  end

    context'購入内容の確認ができないとき' do
      it 'postal_codeが空では登録できない' do
        @buy_send.postal_code =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Postal code can't be blank"
      end


      it 'postal_codeが空はハイフンがないと購入出来ない' do
        @buy_send.postal_code =  '1234567'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Postal code 郵便番号（ハイフンあり7桁)"
      end


      it 'send_areaが空では登録できない' do
        @buy_send.send_area_id =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Send area can't be blank"
      end
      it 'send_areaが1では登録できない' do
        @buy_send.send_area_id = 1
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Send area must be other than 1"
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

      it 'tell_numberが空では登録できない' do
        @buy_send.tell_number =  ''
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Tell number can't be blank"
      end


      it 'tell_numberが数字以外が混じっていると購入できない' do
        @buy_send.tell_number =  '0aあ'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Tell number 携帯番号(ハイフンなし11桁)"
      end

      it 'tell_numberが11桁を超えると購入できない' do
        @buy_send.tell_number =  '090123456789'
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Tell number 携帯番号(ハイフンなし11桁)"
      end


      it "tokenが空では登録できないこと" do
        @buy_send.token = nil
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include("Token can't be blank")
      end


      it "user_idがないと登録できないこと" do
        @buy_send.user_id = nil
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "User can't be blank"
      end

      it "item_idがないと登録できないこと" do 
        @buy_send.item_id = nil
        @buy_send.valid?
        expect(@buy_send.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
