class ShopsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result.page(params[:page])
    @order_item = current_order.order_items.new
    if user_signed_in? && current_user.admin?
      redirect_to admin_path
    end
  end

  def show
    @order_item = current_order.order_items.new
    @product = Product.friendly.find(params[:id])
  end

  def orders
    @check = Checkout.where(user_id: current_user.id)
  end
end
