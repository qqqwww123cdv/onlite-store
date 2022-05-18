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

  describe "new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "add new promo code" do
      promocode = Promocode.new(:id => "2", :code => "1211", :discount => "10")
      expect(promocode).to be_valid
    end
  end
  

  describe "create" do
    it 'successfully creates a new promo code' do
      expect{
          post :create, params: { :promocode => { :id => "1", :code => "1111", :discount => "10" } }
        }.to change(Promocode,:count).by(1)
    end

    it 'promo code has not been create' do
      post :create, params: { :promocode => { :id => "2", :code => "", :discount => "" } }
      expect(response).to render_template(:new)
    end
  end

  describe "update" do
    it 'successfully update promo code' do
      form_params = {
        code: "2222",
        discount: "11",
      }
      patch :update, params: { id:1, promocode: form_params }

      expect(Promocode.find_by_code("2222")).to eq(@promocode)
    end

    it 'promo code has not been updated' do
      form_params = {
        code: "",
        discount: "",
      }
      patch :update, params: { id:1, promocode: form_params }

      expect(response).to render_template(:edit)
    end
  end

  describe "destroy promo code" do
    it 'successfully destroy promo code' do
      expect{
      delete :destroy, params: { id:1 }
      }.to change(Promocode,:count).by(-1)
    end
  end
end