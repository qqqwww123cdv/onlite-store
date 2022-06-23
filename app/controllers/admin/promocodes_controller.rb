class Admin::PromocodesController < Admin::BaseController
  before_action :set_promocode, only: %i[ show edit update destroy ]
  before_action :auth, only: %i[ show edit update destroy ]

  def index
    @promocodes = Promocode.all
    respond_to do |format|
      format.html
      format.csv {send_data @promocodes.to_csv }
    end
  end

  def import
    Promocode.import(params[:file])
    redirect_to admin_promocodes_path
    flash[:success] = "Products imported!"
  end

  def show
  end

  def new
    @promocode = Promocode.new
    authorize @promocode
  end

  def edit
  end

  def create
    @promocode = Promocode.new(promocode_params)
    authorize @promocode
    respond_to do |format|
      if @promocode.save
        format.html { redirect_to admin_promocode_url(@promocode), notice: "Promocode was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promocode.update(promocode_params)
        format.html { redirect_to admin_promocode_url(@promocode), notice: "Promocode was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promocode.destroy
    respond_to do |format|
      format.html { redirect_to admin_promocodes_url, notice: "Promocode was successfully destroyed." }
    end
  end

  private

    def auth
      authorize @promocode
    end

    def set_promocode
      @promocode = Promocode.find(params[:id])
    end

    def promocode_params
      params.require(:promocode).permit(:code, :discount)
    end
end
