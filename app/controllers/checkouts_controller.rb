class CheckoutsController < ApplicationController
  before_action :set_checkout, only: %i[ show edit update destroy ]

  def index
    @checkouts = Checkout.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv {send_data @checkouts.to_csv }
    end
  end

  def show
    @order_items = Order.find(params[:id]).order_items
    @order_item = Order.find(params[:id])
  end

  def new
    @checkout = Checkout.new
    @order_items = current_order.order_items
  end

  def edit
  end

  def create
    @checkout = Checkout.new(checkout_params)
    @order_items = current_order.order_items
    session[:order_id] = nil

    respond_to do |format|
      if @checkout.save
        format.html { redirect_to checkout_url(@checkout), notice: "Your order is accepted!" }
        format.json { render :show, status: :created, location: @checkout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @checkout.update(checkout_params)
        format.html { redirect_to checkout_url(@checkout), notice: "Checkout was successfully updated." }
        format.json { render :show, status: :ok, location: @checkout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @checkout.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Checkout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_checkout
      @checkout = Checkout.find(params[:id])
    end

    def checkout_params
      params.require(:checkout).permit(:name, :email, :address, :pick_up, :user_id, :total_price)
    end
end