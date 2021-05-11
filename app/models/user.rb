class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定'   

       with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ)で入力' } do
         validates :first_name             
         validates :second_name     
       end      
       with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ)で入力' } do 
        validates :first_name_kana 
        validates :second_name_kana 
      end    
      with_options presence: true do
      validates :nick_name
      validates :birthday
      end
      has_many :items
      has_many :buys

end

