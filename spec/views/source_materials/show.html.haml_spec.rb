require 'rails_helper'

RSpec.describe "source_materials/show", type: :view do
  before(:each) do
    @source_material = assign(:source_material, SourceMaterial.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
