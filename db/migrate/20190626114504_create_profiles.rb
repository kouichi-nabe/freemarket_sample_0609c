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

      t.timestamps
    end
  end
end
