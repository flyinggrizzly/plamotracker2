require 'rails_helper'

RSpec.describe "kits/index", type: :view do
  before(:each) do
    assign(:kits, [
      Kit.create!(),
      Kit.create!()
    ])
  end

  it "renders a list of kits" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
