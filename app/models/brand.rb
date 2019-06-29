class Brand < ApplicationRecord
  belongs_to :category
  has_many :items
  has_many :brands
  belongs_to :parent, class_name: :Brand, optional: true
  has_many :children, class_name: :Brand, foreign_key: :parent_id

  scope :child_num, -> (child) {where(parent_id: child)}
end
