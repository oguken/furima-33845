class BuySend
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :send_area_id, :city_town, :address, :building_name, :tell_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :send_area_id
    validates :city_town
    validates :address
    validates :building_name
    validates :token
  end

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号（ハイフンあり7桁)' } do
    validates :postal_code            
  end

  with_options presence: true, format: { with: /\A\d{11}\z/, message: '携帯番号(ハイフンなし11桁)' } do
    validates :tell_number            
  end

  with_options numericality: { other_than: 1 }  do
    validates :send_area_id
  end


  def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, send_area_id: send_area_id, city_town: city_town, address: address, building_name: building_name, tell_number: tell_number, buy_id: buys.id)
  end
end