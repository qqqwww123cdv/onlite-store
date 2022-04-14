require "rails_helper"


RSpec.describe Admin::PromocodesController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }


  before do
    sign_in user
    @promocode = Promocode.new(:id => "1", :code => "1111", :discount => "10")
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
          post :create, params: { :promocode => { :code => "1111", :discount => "10" } }
        }.to change(Promocode,:count).by(1)
    end
  end

  describe "update" do
    it 'successfully update product' do

      form_params = {
        id: @promocode.id,
        code: "1111",
        discount: "11",
      }

      patch :update, params: form_params
      expect(Promocode.find_by_code("1111")).to eq(@promocode)
    end
  end







end