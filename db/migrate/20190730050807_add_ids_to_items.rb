class AddIdsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :child_categories, index: true
    add_reference :items, :grand_child_categories, index: true
  end
end
