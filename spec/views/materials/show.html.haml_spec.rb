require 'rails_helper'

RSpec.describe "materials/show", type: :view do
  before(:each) do
    @material = assign(:material, Material.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
