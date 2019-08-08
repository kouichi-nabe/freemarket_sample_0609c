class ExhibitionController < ApplicationController
  # views/layouts/exhibitionをレイアウトとして使う
  layout "exhibition"

  def index
    @item = Item.new
    categories = Category.all
    @categories = []
    categories.each do |c|
      @categories << [c.name, c.id]
    end
  end

  def create
  end
end
