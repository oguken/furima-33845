class BuySend
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :send_area_id, :city_town, :address, :building_name, :tell_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :send_area_id
    validates :city_town
    validates :address
    validates :building_name
    validates :tell_number
    validates :token, presence: true
  end

  def save
    buys = Buy.create(user_id: user_id, item_id: item_id)
    addresses = Address.create(postal_code: postal_code, send_area_id: send_area_id, city_town: city_town, address: address, building_name: building_name, tell_number: tell_number)
  end
end