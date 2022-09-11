require 'rails_helper'

RSpec.describe "kit_lines/new", type: :view do
  before(:each) do
    assign(:kit_line, KitLine.new())
  end

  it "renders new kit_line form" do
    render

    assert_select "form[action=?][method=?]", kit_lines_path, "post" do
    end
  end
end
