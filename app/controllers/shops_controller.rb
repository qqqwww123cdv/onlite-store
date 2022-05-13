class ShopsController < ApplicationController

  def index
    @categories = Category.all
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
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

  def categories
    @cat = Category.all
    @product = Product.all
    @order_item = current_order.order_items.new
  end

end
