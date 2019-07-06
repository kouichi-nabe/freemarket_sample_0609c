class AddColumnToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :postalcode, :string
    add_column :profiles, :prefecture, :string
    add_column :profiles, :city, :string
    add_column :profiles, :street_number, :string
    add_column :profiles, :building, :string
    add_column :profiles, :phone_number, :string
  end
end
