class Admin::PromocodesController < Admin::BaseController
  before_action :set_promocode, only: %i[ show edit update destroy ]

  def index
    @promocodes = Promocode.all
  end

  def show
  end

  def new
    @promocode = Promocode.new
  end

  def edit
  end

  def create
    @promocode = Promocode.new(promocode_params)

    respond_to do |format|
      if @promocode.save
        format.html { redirect_to admin_promocode_url(@promocode), notice: "Promocode was successfully created." }
        format.json { render :show, status: :created, location: @promocode }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promocode.update(promocode_params)
        format.html { redirect_to admin_promocode_url(@promocode), notice: "Promocode was successfully updated." }
        format.json { render :show, status: :ok, location: @promocode }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promocode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @promocode.destroy

    respond_to do |format|
      format.html { redirect_to admin_promocodes_url, notice: "Promocode was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_promocode
      @promocode = Promocode.find(params[:id])
    end

    def promocode_params
      params.require(:promocode).permit(:code, :discount)
    end
end
