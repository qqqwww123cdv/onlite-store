require "rails_helper"

RSpec.describe Admin::PromocodesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "admin/promocodes").to route_to("admin/promocodes#index")
    end

    it "routes to #new" do
      expect(get: "admin/promocodes/new").to route_to("admin/promocodes#new")
    end

    it "routes to #show" do
      expect(get: "admin/promocodes/1").to route_to("admin/promocodes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "admin/promocodes/1/edit").to route_to("admin/promocodes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "admin/promocodes").to route_to("admin/promocodes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "admin/promocodes/1").to route_to("admin/promocodes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "admin/promocodes/1").to route_to("admin/promocodes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "admin/promocodes/1").to route_to("admin/promocodes#destroy", id: "1")
    end
  end
end
