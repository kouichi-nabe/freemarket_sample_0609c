class PurchaseController < ApplicationController
  
  require 'payjp'
  require 'date'

  def new
    @item = Item.find(1)
    #### 仮置き Item.find(params[:item_id])
    render layout: 'application-off.haml'
  end
  
  def pay
    item = Item.find(1)
    #### 仮置き Item.find(params[:item_id])
    card = Card.find_by(user_id: 7)
    #### 仮置き card = Card.where(user_id: current_user.id).first
    if card
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      charge = Payjp::Charge.create(
        amount:   item.price,
        customer: card.customer_id,
        currency: 'jpy',
      )
      redirect_to root_path, id: 1
      #### 仮置き id: current_user.id
      #### 仮置き マイページが作成されていないため、pathは仮設定
    else
      redirect_to controller: :purchases, action: :new, item_id: 1, notice: 'カード情報を登録してください'
      #### 仮置き item_id: item.id
    end
  end

end
