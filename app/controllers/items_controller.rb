class ItemsController < ApplicationController

  def index
    @categories_list = Category.all
  end
end
