require "rails_helper"

RSpec.describe ShopsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "shops").to route_to("shops#index")
    end

    it "routes to #show" do
      expect(get: "shops/1").to route_to("shops#show", id: "1")
    end

  end
end
