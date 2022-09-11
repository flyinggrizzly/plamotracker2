require "rails_helper"

RSpec.describe KitLinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kit_lines").to route_to("kit_lines#index")
    end

    it "routes to #new" do
      expect(get: "/kit_lines/new").to route_to("kit_lines#new")
    end

    it "routes to #show" do
      expect(get: "/kit_lines/1").to route_to("kit_lines#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/kit_lines/1/edit").to route_to("kit_lines#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kit_lines").to route_to("kit_lines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kit_lines/1").to route_to("kit_lines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kit_lines/1").to route_to("kit_lines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kit_lines/1").to route_to("kit_lines#destroy", id: "1")
    end
  end
end
