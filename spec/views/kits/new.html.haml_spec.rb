require 'rails_helper'

RSpec.describe "kits/new", type: :view do
  before(:each) do
    assign(:kit, Kit.new())
  end

  it "renders new kit form" do
    render

    assert_select "form[action=?][method=?]", kits_path, "post" do
    end
  end
end
