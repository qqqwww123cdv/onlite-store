class ShopsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
    @order_item = current_order.order_items.new
    if user_signed_in? && current_user.admin?
      redirect_to products_path
    end
  end

  def show
    @order_item = current_order.order_items.new

    @product = Product.find(params[:id])
  end
end
