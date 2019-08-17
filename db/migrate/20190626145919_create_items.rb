class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.references :buyer
      t.references :seller
      t.string :brand

      t.timestamps
    end
  end
end
