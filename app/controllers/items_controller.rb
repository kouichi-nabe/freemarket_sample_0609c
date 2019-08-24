class ItemsController < ApplicationController

  def index
    @categories_list = Category.all
    @items = Item.where(category_id: 1).order("created_at DESC").limit(4)
  end
end
