require 'rails_helper'

RSpec.describe "kit_scales/edit", type: :view do
  before(:each) do
    @kit_scale = assign(:kit_scale, KitScale.create!())
  end

  it "renders the edit kit_scale form" do
    render

    assert_select "form[action=?][method=?]", kit_scale_path(@kit_scale), "post" do
    end
  end
end
