require 'rails_helper'

RSpec.describe "kit_scales/index", type: :view do
  before(:each) do
    assign(:kit_scales, [
      KitScale.create!(),
      KitScale.create!()
    ])
  end

  it "renders a list of kit_scales" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
