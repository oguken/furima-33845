require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end



  describe 'ユーザー新規登録' do
    context'新規登録できるとき' do
      it '全ての値が正しく入力できていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context'新規登録できないとき' do
    it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nick name can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードは、全角では登録出来ない。' do
      @user.password = 'ああ１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password 英字と数字の両方を含めて設定"
    end

    it 'パスワードは、英語だけで入力出来ない。' do
      @user.password = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password 英字と数字の両方を含めて設定"
    end

    it 'パスワードは,数字だけで入力出来ない。' do
      @user.password = '00'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password 英字と数字の両方を含めて設定"
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = '00000a'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = '00000a'
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end


    it '上の名前（全角）が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '上の名前（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角（漢字・ひらがな・カタカナ)で入力"
    end
    it '下の名前（全角）が空では登録できない' do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
    it '下の名前（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.second_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name 全角（漢字・ひらがな・カタカナ)で入力"
    end
    it '上の名前カナ（全角）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '上の名前カナ（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角（カタカナ)で入力"
    end
    it '下の名前カナ（全角）が空では登録できない' do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana can't be blank"
    end
    it '下の名前カナ（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.second_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana 全角（カタカナ)で入力"
    end
    it 'birthdayが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
  end
  end
 end
  