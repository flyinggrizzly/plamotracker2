require 'rails_helper'

RSpec.describe "source_materials/new", type: :view do
  before(:each) do
    assign(:source_material, SourceMaterial.new())
  end

  it "renders new source_material form" do
    render

    assert_select "form[action=?][method=?]", source_materials_path, "post" do
    end
  end
end
