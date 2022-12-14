require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/kit_scales", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # KitScale. As you add validations to KitScale, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      KitScale.create! valid_attributes
      get kit_scales_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      kit_scale = KitScale.create! valid_attributes
      get kit_scale_url(kit_scale)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_kit_scale_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      kit_scale = KitScale.create! valid_attributes
      get edit_kit_scale_url(kit_scale)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new KitScale" do
        expect {
          post kit_scales_url, params: { kit_scale: valid_attributes }
        }.to change(KitScale, :count).by(1)
      end

      it "redirects to the created kit_scale" do
        post kit_scales_url, params: { kit_scale: valid_attributes }
        expect(response).to redirect_to(kit_scale_url(KitScale.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new KitScale" do
        expect {
          post kit_scales_url, params: { kit_scale: invalid_attributes }
        }.to change(KitScale, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post kit_scales_url, params: { kit_scale: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested kit_scale" do
        kit_scale = KitScale.create! valid_attributes
        patch kit_scale_url(kit_scale), params: { kit_scale: new_attributes }
        kit_scale.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the kit_scale" do
        kit_scale = KitScale.create! valid_attributes
        patch kit_scale_url(kit_scale), params: { kit_scale: new_attributes }
        kit_scale.reload
        expect(response).to redirect_to(kit_scale_url(kit_scale))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        kit_scale = KitScale.create! valid_attributes
        patch kit_scale_url(kit_scale), params: { kit_scale: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested kit_scale" do
      kit_scale = KitScale.create! valid_attributes
      expect {
        delete kit_scale_url(kit_scale)
      }.to change(KitScale, :count).by(-1)
    end

    it "redirects to the kit_scales list" do
      kit_scale = KitScale.create! valid_attributes
      delete kit_scale_url(kit_scale)
      expect(response).to redirect_to(kit_scales_url)
    end
  end
end
