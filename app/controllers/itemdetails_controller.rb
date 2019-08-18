class ItemdetailsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    puts "\n\n\n\nprint!"
    puts @item.images[0].image
    #redirect_to "/itemdetails"
  end
end
