class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Only available for admin!" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end

  rescue_from Pundit::NotDefinedError do
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Only available for admin!" }
      format.json { render json: {}, status: :unprocessable_entity }
    end
  end

  # GET /products or /products.json
  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  # GET /products/1 or /products/1.json
  def show
    authorize @product
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    authorize @product
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product
    @product.destroy
    
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_all
    Product.delete_all
    flash[:notice] = "You have removed all products!"
    redirect_to products_url
  end

  def discontinue
    Product.destroy(params[:product_ids])
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :image, :vendor_code, :price, :description)
    end
end
