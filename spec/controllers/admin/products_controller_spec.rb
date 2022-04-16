require "rails_helper"


RSpec.describe Admin::ProductsController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    @product = Product.create(:id => "1", :product_name => "TV", :vendor_code => '1234567', :description => 'text', :price => '20')
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
    it 'successfully creates' do
      expect{
          post :create, params: { :product => { :id => "1", :product_name => "testuser", :vendor_code => "1234567", :description => "asdf", :price => "11" } }
        }.to change(Product,:count).by(1)
    end
  end

  describe "update" do
    it 'successfully update' do
      form_params = {
        product_name: "Big tv",
        vendor_code: "1234567",
        description: "text",
        price: "20",
      }
      patch :update, params: { id:1, product: form_params }

      expect(Product.find_by_product_name("Big tv")).to eq(@product)
    end
  end


  describe "destroy" do
    it 'successfully destroy' do
      expect{
      delete :destroy, params: { id:1 }
      }.to change(Product,:count).by(-1)
    end
  end

  describe "delete_all" do
    it 'successfully destroy' do
      expect{
      Product.delete_all
      }.to change(Product,:count).by(-1)
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