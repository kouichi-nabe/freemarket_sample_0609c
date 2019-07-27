class CardsController < ApplicationController
   require 'payjp'

   def index # カード追加ボタン表示 or カード情報&削除ボタン表示
      @card = current_user.card
      if @card
         Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
         customer = Payjp::Customer.retrieve(@card.customer_id)
         @default_card_information = customer.cards.retrieve(@card.card_id)
      end
   end

   def new
      gon.payjp_test_pk = Rails.application.credentials.payjp[:test_public_key]
      render layout: 'application-off.haml'
   end
   def show
      render layout: 'application-off.haml'
   end

   def add
      gon.payjp_test_pk = Rails.application.credentials.payjp[:test_public_key]
   end

   def pay
      Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
      if card_params.blank?
         flash[:alert] = '入力されたカード情報が不正です'
         case card_params[:move_from_action]
         when 'add'
            redirect_to action: :add, notice: '入力されたカード情報が不正です'
         when 'new'
            redirect_to action: :new, notice: '入力されたカード情報が不正です'
         when 'purchase'
            redirect_to card_item_purchases_path(params[:item_id]), notice: '入力されたカード情報が不正です'
         end
      else
         customer = Payjp::Customer.create(
            description: '登録テスト', 
            email: current_user.email, 
            card: params[:payjp_token],
            metadata: {user_id: current_user.id}
            ) 
            @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
            
         if @card.save
         
         case card_params[:move_from_action]
            when 'add'
               flash[:notice] = 'クレジットカードを登録しました'
               redirect_to action: :index
            when 'new'
               redirect_to signups_complete_path
            when 'purchase'
               redirect_to new_item_purchase_path(params[:item_id])
            end
         else
            flash[:alert] = '入力されたカード情報が不正です'
            case card_params[:move_from_action]
            when 'add'
               redirect_to action: :add, notice: '入力されたカード情報が不正です'
            when 'new'
               redirect_to action: :new, notice: '入力されたカード情報が不正です'
            when 'purchase'
               redirect_to card_item_purchases_path(params[:item_id]), alert: '入力されたカード情報が不正です'
            end
         end
      end
   end

   def destroy #PayjpとCardデータベースを削除
      card = Card.find_by(user_id: current_user.id)
      if card.present?
        Payjp.api_key = Rails.application.credentials.payjp[:test_secret_key]
        customer = Payjp::Customer.retrieve(card.customer_id)
        customer.delete
        card.destroy
        flash[:notice] = 'クレジットカードを削除しました'
        case params[:move_from]
          when 'purchase'
            redirect_to new_item_purchase_path(params[:item_id]), notice: 'クレジットカードを削除しました'
            return
          else
            redirect_to action: :index, notice: 'クレジットカードを削除しました'
            return
        end
      else
        flash[:alert] = 'クレジットカードが登録されていません'
        redirect_to action: :index
      end
   end

   private

   def card_params
      params.permit(:payjp_token, :move_from_action)
   end
end
