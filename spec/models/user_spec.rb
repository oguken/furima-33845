require 'rails_helper'
RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it '上の名前（全角）が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '上の名前（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it '下の名前（全角）が空では登録できない' do
      @user.second_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
    it '下の名前（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.second_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it '上の名前カナ（全角）が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '上の名前カナ（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it '下の名前カナ（全角）が空では登録できない' do
      @user.second_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name kana can't be blank"
    end
    it '下の名前カナ（全角）が漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.second_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'birthdayが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
 end
  