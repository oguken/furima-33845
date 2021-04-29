class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :send_money_burden
  belongs_to :send_area
  belongs_to :send_days
  

  has_one_attached :item_image

  validates :item_name,            presence: true
  validates :item_manual,          presence: true
  validates :category_id,          presence: true
  validates :item_condition_id,    presence: true
  validates :send_money_burden_id, presence: true
  validates :send_area_id,         presence: true
  validates :send_days_id,         presence: true
  validates :price,                presence: true
  validates :item_image,           presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :send_money_burden_id, numericality: { other_than: 1 }
  validates :send_area_id, numericality: { other_than: 1 } 
  validates :send_days_id, numericality: { other_than: 1 } 
end
