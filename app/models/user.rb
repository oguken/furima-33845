class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
       with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
         validates :nick_name, 
         validates :first_name,              
         validates :second_name,      
         validates :first_name_kana,  
         validates :second_name_kana, 
         validates :birthday,        
  end
