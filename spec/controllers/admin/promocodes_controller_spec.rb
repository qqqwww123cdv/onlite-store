require "rails_helper"


RSpec.describe Admin::PromocodesController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    @promocode = Promocode.create(:id => "1", :code => "1111", :discount => "10")
  end

  describe "index" do
    it "has a 200 status code" do
      get :index
      promocode = Promocode.all
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
          post :create, params: { :promocode => { :id => "1", :code => "1111", :discount => "10" } }
        }.to change(Promocode,:count).by(1)
    end
  end

  describe "update" do
    it 'successfully update product' do
      form_params = {
        code: "2222",
        discount: "11",
      }
      patch :update, params: { id:1, promocode: form_params }

      expect(Promocode.find_by_code("2222")).to eq(@promocode)
    end
  end

  describe "destroy" do
    it 'successfully destroy' do
      expect{
      delete :destroy, params: { id:1 }
      }.to change(Promocode,:count).by(-1)
    end
  end
end