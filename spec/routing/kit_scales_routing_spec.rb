require "rails_helper"

RSpec.describe KitScalesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kit_scales").to route_to("kit_scales#index")
    end

    it "routes to #new" do
      expect(get: "/kit_scales/new").to route_to("kit_scales#new")
    end

    it "routes to #show" do
      expect(get: "/kit_scales/1").to route_to("kit_scales#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/kit_scales/1/edit").to route_to("kit_scales#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kit_scales").to route_to("kit_scales#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kit_scales/1").to route_to("kit_scales#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kit_scales/1").to route_to("kit_scales#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kit_scales/1").to route_to("kit_scales#destroy", id: "1")
    end
  end
end
