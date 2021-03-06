class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table   :items do |t|
      t.string     :item_name,             null: false  
      t.text       :item_manual,           null: false 
      t.integer    :category_id,           null: false 
      t.integer    :item_condition_id,     null: false 
      t.integer    :send_money_burden_id,  null: false 
      t.integer    :send_area_id,          null: false 
      t.integer    :send_days_id,          null: false 
      t.integer    :price,                 null: false 
      t.references :user,                  foreign_key: true
      t.timestamps
    end
  end
end
