class AddCategoriesFromItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :top_category, null: false
    add_reference :items, :parent_category, null: false
    add_foreign_key :items, :categories, column: :top_category_id
    add_foreign_key :items, :categories, column: :parent_category_id
  end
end
