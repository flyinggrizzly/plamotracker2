require 'rails_helper'

RSpec.describe "kits/edit", type: :view do
  before(:each) do
    @kit = assign(:kit, Kit.create!())
  end

  it "renders the edit kit form" do
    render

    assert_select "form[action=?][method=?]", kit_path(@kit), "post" do
    end
  end
end
