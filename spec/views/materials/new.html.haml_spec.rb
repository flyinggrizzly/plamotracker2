require 'rails_helper'

RSpec.describe "materials/new", type: :view do
  before(:each) do
    assign(:material, Material.new())
  end

  it "renders new material form" do
    render

    assert_select "form[action=?][method=?]", materials_path, "post" do
    end
  end
end
