require 'rails_helper'

RSpec.describe "kit_lines/index", type: :view do
  before(:each) do
    assign(:kit_lines, [
      KitLine.create!(),
      KitLine.create!()
    ])
  end

  it "renders a list of kit_lines" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
