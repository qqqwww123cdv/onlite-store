class ShopsController < ApplicationController
  def index
    @products = Product.all
    if user_signed_in? && current_user.admin?
      redirect_to products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
