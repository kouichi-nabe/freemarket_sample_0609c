class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :prefecture, :integer, null: false
  end

  def down
    change_column :addresses, :prefecture, :string, null: false
  end
end
