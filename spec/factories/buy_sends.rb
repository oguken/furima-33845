FactoryBot.define do
  factory :buy_send do
    postal_code         {'123-4567'}              
    send_area_id        {2}                 
    city_town           {'漢字'}             
    address             {'漢字'}              
    building_name       {'漢字'}            
    tell_number         {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"} 
  end
end
