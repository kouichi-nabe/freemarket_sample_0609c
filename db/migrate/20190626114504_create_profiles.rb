class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name,null: false
      t.string :first_name_kana,null: false
      t.string :last_name_kana,null: false
      t.string :self_introduction
      t.date :brithday
      t.integer :user_id
      t.string :postalcode
      t.string :prefecture
      t.string :city
      t.string :street_number
      t.string :building
      t.string :phone_number

      t.timestamps
    end
  end
end
