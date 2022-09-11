require 'rails_helper'

RSpec.describe "source_materials/edit", type: :view do
  before(:each) do
    @source_material = assign(:source_material, SourceMaterial.create!())
  end

  it "renders the edit source_material form" do
    render

    assert_select "form[action=?][method=?]", source_material_path(@source_material), "post" do
    end
  end
end
