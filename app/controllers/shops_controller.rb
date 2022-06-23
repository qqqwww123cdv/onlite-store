class ShopsController < ApplicationController
  before_action :set_order_item

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    if user_signed_in? && current_user.admin?
      redirect_to admin_path
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  def orders
    @check = Checkout.where(user_id: current_user.id)
  end

  def categories
    @q = Category.ransack(params[:q])
    @cat = @q.result(distinct: true)
    @product = Product.all
  end

  def about_us; end
  
  def bonus; end

  private

  def set_order_item
    @order_item = current_order.order_items.new
  end
end
