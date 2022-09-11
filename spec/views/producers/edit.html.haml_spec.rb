require 'rails_helper'

RSpec.describe "producers/edit", type: :view do
  before(:each) do
    @producer = assign(:producer, Producer.create!())
  end

  it "renders the edit producer form" do
    render

    assert_select "form[action=?][method=?]", producer_path(@producer), "post" do
    end
  end
end
