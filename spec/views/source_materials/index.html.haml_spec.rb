require 'rails_helper'

RSpec.describe "source_materials/index", type: :view do
  before(:each) do
    assign(:source_materials, [
      SourceMaterial.create!(),
      SourceMaterial.create!()
    ])
  end

  it "renders a list of source_materials" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
