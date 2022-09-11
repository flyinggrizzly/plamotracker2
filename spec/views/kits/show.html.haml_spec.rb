require 'rails_helper'

RSpec.describe "kits/show", type: :view do
  before(:each) do
    @kit = assign(:kit, Kit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
