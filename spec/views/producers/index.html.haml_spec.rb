require 'rails_helper'

RSpec.describe "producers/index", type: :view do
  before(:each) do
    assign(:producers, [
      Producer.create!(),
      Producer.create!()
    ])
  end

  it "renders a list of producers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
