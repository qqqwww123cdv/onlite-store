require "rails_helper"


RSpec.describe Admin::ProductsController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product) }

 
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
    @product = Product.new(:id => "1", :product_name => "TV", :vendor_code => '1234567', :description => 'text', :price => 20)
  end

  describe "index" do
    it "has a 200 status code" do
      get :index
      product = Product.all
      expect(response.status).to eq(200)
    end
  end

  it "creates a Widget and redirects to the Widget's page" do
    get :new
    expect(response.status).to eq(200)
  end
  

  describe "create" do
    it 'successfully creates a new product' do
      expect{
          post :create, params: { :product => { :id => "1", :product_name => "testuser", :vendor_code => "1234567", :description => "asdf", :price => "11" } }
        }.to change(Product,:count).by(1)
    end
  end

  describe "update" do
    it 'successfully update product' do
      patch :update, id: @product.id, product: { name: "xyz"}
      expect(response).to be_redirect
    end
  end


  describe "test" do
    it "allows you to edit a reviewed scorecard" do

    product = Product.new(:id => "1", :product_name => "TV", :vendor_code => '1234567', :description => 'text', :price => 20)

    get 'edit', :id => product.id
    response.status.should be(200)
    end
  end

  describe "Product update" do
    it "update Product" do
      @product.update(:product_name => "Big TV")
      expect(Product.find_by_product_name("Big TV")).to eq(@product)
    end
  end

  describe "GET new" do
    it "add new Product" do
      product = Product.new(:product_name => "Tb", :vendor_code => '1234566', :description => 'Text', :price => 20)
      expect(product).to be_valid
    end
  end


end