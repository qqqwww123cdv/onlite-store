class Admin::HomepageController < Admin::BaseController
  def index
    @checkouts = Checkout.paginate(page: params[:page], per_page: 10)
    @products = Product.paginate(page: params[:page], per_page: 10)
    @user = User.all
  end
end
