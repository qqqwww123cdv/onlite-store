class OrderItemsController < ApplicationController
  before_action :set_order, only: %i[ create update destroy ]

  def create
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to root_path, notice: "#{@order_item.product.product_name} was successfully added to the cart!"
    @order_item.product.product_name
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items
end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
    redirect_to root_path, notice: "#{@order_item.product.product_name} was successfully destroyed."
  end

  private

  def set_order
    @order = current_order
  end

  def order_params
    params.require(:order_item).permit(:product_id, :quantity, :user_id)
  end
end
