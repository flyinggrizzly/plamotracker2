require 'rails_helper'

RSpec.describe "designers/new", type: :view do
  before(:each) do
    assign(:designer, Designer.new())
  end

  it "renders new designer form" do
    render

    assert_select "form[action=?][method=?]", designers_path, "post" do
    end
  end
end
