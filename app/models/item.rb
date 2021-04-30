class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :send_money_burden
  belongs_to :send_area
  belongs_to :send_days
  

  has_one_attached :item_image

  with_options presence: true do
  validates :item_name
  validates :item_manual
  validates :category_id
  validates :item_condition_id
  validates :send_money_burden_id
  validates :send_area_id
  validates :send_days_id
  validates :price
  validates :item_image
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}  

  with_options numericality: { other_than: 1 }  do
  validates :category_id
  validates :item_condition_id
  validates :send_money_burden_id
  validates :send_area_id
  validates :send_days_id
  end
end
