class GrandChildCategory < ApplicationRecord
  belongs_to :child_category
  has_many :items
end
