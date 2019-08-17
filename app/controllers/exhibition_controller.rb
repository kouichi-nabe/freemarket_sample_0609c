class ExhibitionController < ApplicationController
  # views/layouts/exhibitionをレイアウトとして使う
  layout "exhibition"

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
    puts ''
    puts ''
    puts 'create called'
    puts ''
    puts ''

    current_user.id
    # TODO: itemに紐づいていないものはどうしようか?
    params = params_int(item_params)
    params[:seller_id] = current_user.id
    params[:postage] = 1 # todo
    Category.create(name: "レディース")
    @item = Item.new(params)
    @item.save! # DBに保存バリデーションに引っかかる場合例外
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition, :size, :brand, :shipping_method, :region, :shipping_date, :price,images_attributes: [:image])
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
end
