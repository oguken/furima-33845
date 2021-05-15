class BuySend
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :send_area_id, :city_town, :address, :building_name, :tell_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :send_area_id
    validates :city_town
    validates :address
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号（ハイフンあり7桁)' }
    validates :tell_number, format: { with: /\A\d{10,11}\z/, message:'携帯番号(ハイフンなし10桁or11桁)' } 
  end


  with_options numericality: { other_than: 1 }  do
    validates :send_area_id
  end


  def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, send_area_id: send_area_id, city_town: city_town, address: address, building_name: building_name, tell_number: tell_number, buy_id: buys.id)
  end
end