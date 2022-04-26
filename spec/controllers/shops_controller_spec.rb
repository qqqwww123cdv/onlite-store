require "rails_helper"


RSpec.describe ShopsController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    @product = Product.create(:id => "1", :product_name => "tv", :vendor_code => '1234567', :description => 'text', :price => '20')

  end

  describe "show" do
    it 'successfully show product' do
      get :show, params: { id:1}
      expect(response.status).to eq(200)
    end
  end
end