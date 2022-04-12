require "rails_helper"


RSpec.describe Admin::ProductsController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    {
      'product_name'=> 'anton',
      'vendor_code' => '1234567',
      'description' =>'1111111',
      'price' => '12',
    }
  end
  let(:invalid_attributes) do
    {
      'product_name'=> '',
      'vendor_code' => '123457',
      'description' =>'1111111',
      'price' => '12',
    }
  end

  before do
    sign_in user
    @product = Product.new(:product_name => "TV", :vendor_code => '1234567', :description => 'text', :price => 20)
  end

  describe "product valid" do
    it 'checks that a product can be created' do
      expect(@product).to be_valid
    end
  end

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end


  describe "Product create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          Product.create! valid_attributes
        }.to change(Product, :count).by(1)
      end
    end
  end

end