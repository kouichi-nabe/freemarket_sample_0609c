class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code, null: false
      t.integer :prefecture, null: false
      t.string :municipality, null: false
      t.string :house_number, null: false
      t.integer :phone_number
      t.string :building_name
      t.integer :user_id

      t.timestamps
    end
  end
end
