class ExhibitionController < ApplicationController
  # views/layouts/exhibitionをレイアウトとして使う
  layout "exhibition"

  def index
    @item = Item.new
  end

  def create
  end
end
