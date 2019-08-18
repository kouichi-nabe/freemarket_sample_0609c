class CreateChildCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :child_categories do |t|
      t.string :name
      t.references :categories, null: false, foreign_key: true
    end
  end
end
