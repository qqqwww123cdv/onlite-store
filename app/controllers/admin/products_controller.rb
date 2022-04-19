class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :auth, only: %i[ show edit update destroy delete_all]

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_all
    Product.delete_all
    flash[:success] = "You have removed all products!"
    redirect_to admin_products_path
  end

  def discontinue
    Product.destroy(params[:product_ids])
    redirect_to admin_products_path
  end

  def auth
    authorize @product
  end

  private

    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:product_name, :image, :vendor_code, :price, :description)
    end
end
