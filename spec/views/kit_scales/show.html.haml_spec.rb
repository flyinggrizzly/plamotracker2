require 'rails_helper'

RSpec.describe "kit_scales/show", type: :view do
  before(:each) do
    @kit_scale = assign(:kit_scale, KitScale.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
