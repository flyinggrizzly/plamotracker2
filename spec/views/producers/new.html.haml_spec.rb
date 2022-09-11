require 'rails_helper'

RSpec.describe "producers/new", type: :view do
  before(:each) do
    assign(:producer, Producer.new())
  end

  it "renders new producer form" do
    render

    assert_select "form[action=?][method=?]", producers_path, "post" do
    end
  end
end
