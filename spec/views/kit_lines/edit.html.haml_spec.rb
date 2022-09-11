require 'rails_helper'

RSpec.describe "kit_lines/edit", type: :view do
  before(:each) do
    @kit_line = assign(:kit_line, KitLine.create!())
  end

  it "renders the edit kit_line form" do
    render

    assert_select "form[action=?][method=?]", kit_line_path(@kit_line), "post" do
    end
  end
end
