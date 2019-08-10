class CreateGrandChildCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :grand_child_categories do |t|
      t.string :name
      t.references :child_categories, null: false, foreign_key: true
    end
  end
end
