class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table   :addresses do |t|
      t.string     :postal_code,   null: false 
      t.integer    :send_area_id,  null: false 
      t.string     :city_town,     null: false 
      t.string     :address,       null: false 
      t.string     :building_name, null: false 
      t.string     :tell_number,   null: false 
      t.references :buy,           foreign_key: true

      t.timestamps
    end
  end
end
