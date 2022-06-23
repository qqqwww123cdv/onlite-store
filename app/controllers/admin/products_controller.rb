class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :auth, only: %i[ show edit update destroy ]
  before_action :set_categories
  
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.csv {send_data @products.to_csv }
    end
  end

  def import
    Product.import(params[:file])
    redirect_to admin_products_path
    flash[:success] = "Products imported!"
  end

  def show; end

  def new
    @product = Product.new
    authorize @product
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: "Product was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_path, notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @product.can_destr?
      @product.destroy
      respond_to do |format|
        format.html { redirect_to admin_products_path, notice: "Product was successfully destroyed." }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_products_path }
        flash[:alert] = "You cannot delete this product, it is in the user's cart or order"
      end
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

  def set_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(:product_name, :image, :vendor_code, :price, :description, :category_id)
  end
end
