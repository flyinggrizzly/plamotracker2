require 'rails_helper'

RSpec.describe "kit_scales/new", type: :view do
  before(:each) do
    assign(:kit_scale, KitScale.new())
  end

  it "renders new kit_scale form" do
    render

    assert_select "form[action=?][method=?]", kit_scales_path, "post" do
    end
  end
end
