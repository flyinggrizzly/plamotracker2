require 'rails_helper'

RSpec.describe "kit_lines/show", type: :view do
  before(:each) do
    @kit_line = assign(:kit_line, KitLine.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
