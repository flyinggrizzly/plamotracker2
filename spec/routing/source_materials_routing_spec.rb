require "rails_helper"

RSpec.describe SourceMaterialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/source_materials").to route_to("source_materials#index")
    end

    it "routes to #new" do
      expect(get: "/source_materials/new").to route_to("source_materials#new")
    end

    it "routes to #show" do
      expect(get: "/source_materials/1").to route_to("source_materials#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/source_materials/1/edit").to route_to("source_materials#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/source_materials").to route_to("source_materials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/source_materials/1").to route_to("source_materials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/source_materials/1").to route_to("source_materials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/source_materials/1").to route_to("source_materials#destroy", id: "1")
    end
  end
end
