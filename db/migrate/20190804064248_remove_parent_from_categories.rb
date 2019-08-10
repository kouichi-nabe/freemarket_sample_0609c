class RemoveParentFromCategories < ActiveRecord::Migration[5.2]
  def change
    # parentを削除
    remove_reference :categories, :parent
  end
end
