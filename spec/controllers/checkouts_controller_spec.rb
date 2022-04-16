require "rails_helper"


RSpec.describe CheckoutsController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    @checkout = Checkout.create(:id => "1", :name => "anton", :address => "Smorgovski streat house 29 apartment 68", :email => "test@mail.ru", :pick_up => true,  :user_id => '1', :total_price => '120')
  end

  describe "index" do
    it "has a 200 status code" do
      get :index
      checkout = Checkout.all
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
          post :create, params: { :checkout => { :id => "1", :name => "Anton", :address => "Smorgovski streat house 29 apartment 68", :email => "test@mail.ru", :pick_up => true,  :user_id => '1', :total_price => '120' } }
        }.to change(Checkout,:count).by(1)
    end
  end

  describe "update" do
    it 'successfully update product' do
      form_params = {
        name: "Sergei",
        address: "Smorgovski streat house 29 apartment 68",
        email: "test@mail.ru"
      }
      patch :update, params: { id:1, checkout: form_params }

      expect(Checkout.find_by_name("Sergei")).to eq(@checkout)
    end
  end

  describe "destroy" do
    it 'successfully destroy' do
      expect{
      delete :destroy, params: { id:1 }
      }.to change(Checkout,:count).by(-1)
    end
  end
end