class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.references :buyer
      t.references :seller
      t.string :brand
      t.integer :size
      t.integer :price, null: false
      t.integer :postage, null: false
      t.integer :shipping_method, null: false
      t.integer :region, null: false
      t.integer :shipping_date, null: false
      t.integer :condition, null: false
      t.integer :receive_completed
      t.timestamps
    end
  end
end
