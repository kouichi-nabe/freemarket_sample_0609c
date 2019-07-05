class CreateBuyOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_orders do |t|
      t.references :seller, null: false
      t.references :buyer, null: false
      t.references :item, null: false, foreign_key: true
      t.integer :receive_completed, null: false
      t.integer :price
      t.date :purchase_date

      t.timestamps
    end
  end
end
