class CardsController < ApplicationController
   def index
   end

   def new
      render layout: 'application-off.haml'
   end
   def show
      render layout: 'application-off.haml'
   end

   def pay
      if card_params.blank?
         flash[:alert] = '入力されたカード情報が不正です'
         redirect_to action: :new, notice: '入力されたカード情報が不正です'
      else
         redirect_to signups_complete_path
      end
   end
   private

   def card_params
      params.permit(:move_from_action)
   end
end
