require "rails_helper"


RSpec.describe Admin::CategoriesController, :type => :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
    @category = Category.create(:id => "1", :name=> "test", :description => "test2")
  end

  describe "index" do
    it "has a 200 status code" do
      get :index
      category = Category.all
      expect(response.status).to eq(200)
    end
  end

  describe "new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end

    it "add new Category" do
      category = Category.new(:id => "2", :name=> "ttest", :description => "ttest2")
      expect(category).to be_valid
    end
  end

  describe "create" do
    it 'successfully creates a new category' do
      expect{
          post :create, params: { :category => { :id => "2", :name=> "ttest", :description => "ttest2" } }
        }.to change(Category,:count).by(1)
    end

    it 'category has not been create' do
      post :create, params: { :category => { :id => "2", :name=> "", :description => "ttest2" } }
      expect(response).to render_template(:new)
    end
  end

  describe "update" do
    it 'successfully update category' do
      form_params = {
        name: "tech",
        description: "text"
      }
      patch :update, params: { id:1, category: form_params }

      expect(Category.find_by_name("tech")).to eq(@category)
    end

    it 'category has not been updated' do
      form_params = {
        name: "",
        description: "",
      }
      patch :update, params: { id:1, category: form_params }

      expect(response).to render_template(:edit)
    end
  end

  describe "destroy category" do
    it 'successfully destroy category' do
      expect{
        delete :destroy, params: { id:1 }
      }.to change(Category,:count).by(-1)
    end
  end


end