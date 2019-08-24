class ExhibitionController < ApplicationController
  # views/layouts/exhibitionをレイアウトとして使う
  layout "exhibition"
  before_action :set_product, only: [:destroy]

  def index
    @item = Item.new
    2.times { @item.images.build } # Itemにひもづくimageを2つ生成
                                   # accepts_nested_attributes_for :imagesがItemに必要?
    categories = Category.all
    @categories = []
    categories.each do |c|
      @categories << [c.name, c.id]
    end
  end

  def create
    current_user.id

    params = params_int(item_params)
    params[:seller_id] = current_user.id
    params[:postage] = 1

    @item = Item.new(params)
    if @item.save
      # 同じページのモーダル表示の表示の仕方がわからん
      redirect_to itemdetail_path(@item)
    else
      # DBのバリデーションに引っかかる場合
      redirect_to sell_path
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path, notice: "削除しました。"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :child_categories_id, :grand_child_categories_id, :condition, :size, :brand, :shipping_method, :region, :shipping_date, :price,images_attributes: [:image])
  end

  def params_int(model_params)
    model_params.each do |key,value|
      if integer_string?(value)
        model_params[key]=value.to_i
      end
    end
  end

  def integer_string?(str)
    begin
      Integer(str)
      true
    rescue
      false
    end
  end

  def set_product
    @item = Item.find(params[:id])
  end
end
