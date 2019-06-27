class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :size, :integer
    add_column :items, :price, :integer, null: false
    add_column :items, :postage, :integer, null: false
    add_column :items, :shipping_method, :integer, null: false
    add_column :items, :region, :integer, null: false
    add_column :items, :shipping_date, :integer, null: false
    add_column :items, :condition, :integer, null: false
    add_column :items, :receive_completed, :integer
  end
end
