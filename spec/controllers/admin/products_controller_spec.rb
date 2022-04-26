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

  describe "new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "add new Product" do
      product = Product.new(:id => "2", :product_name => "Tb", :vendor_code => '1234566', :description => 'Text', :price => 20)
      expect(product).to be_valid
    end
  end

  describe "create" do
    it 'successfully creates a new product' do
      expect{
          post :create, params: { :product => { :id => "1", :product_name => "testuser", :vendor_code => "1234567", :description => "asdf", :price => "11" } }
        }.to change(Product,:count).by(1)
    end

    it 'product has not been create' do
      post :create, params: { :product => { :id => "2", :product_name => "", :vendor_code => "", :description => "", :price => "" } }
      expect(response).to render_template(:new)
    end
  end

  describe "update" do
    it 'successfully update product' do
      form_params = {
        product_name: "Big tv",
        vendor_code: "1234567",
        description: "text",
        price: "20",
      }
      patch :update, params: { id:1, product: form_params }

      expect(Product.find_by_product_name("Big tv")).to eq(@product)
    end

    it 'product has not been updated' do
      form_params = {
        product_name: "",
        vendor_code: "",
        description: "",
        price: "",
      }
      patch :update, params: { id:1, product: form_params }

      expect(response).to render_template(:edit)
    end
  end

  describe "destroy product" do
    it 'successfully destroy product' do
      expect{
        delete :destroy, params: { id:1 }
      }.to change(Product,:count).by(-1)
    end
  end

  describe "destroy all products" do
    it 'successfully destroy all products' do
    expect{
      get :delete_all
      }.to change(Product,:count).by(-1) 
     end
  end

  describe "delete selected products" do
    it 'selected products have been successfully deleted' do
      expect{
        delete :discontinue, params: { product_ids:1 }
      }.to change(Product,:count).by(-1)
      end
  end
end