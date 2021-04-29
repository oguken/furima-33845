FactoryBot.define do
  factory :item do

    item_name             {'test'}
    item_manual           {'test'}
    category_id              {2}
    item_condition_id        {2}
    send_money_burden_id     {2}
    send_area_id             {2}
    send_days_id             {2}
    price                 {'300~9999999'}
    
    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
