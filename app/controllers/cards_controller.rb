class CardsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def prom
    @promocode = Promocode.where(code: params[:promocode]).first

    if @promocode == nil 
      redirect_to cards_show_path
      flash[:alert] = "Sorry, your promo code is incorrect or no longer valid."
    else
      current_order.applay_promocode(@promocode)
      redirect_to cards_show_path
      flash[:success] = "You used a promo code, discount is #{@promocode.discount}%"
    end
  end 

end

