require 'rails_helper'

RSpec.describe "producers/show", type: :view do
  before(:each) do
    @producer = assign(:producer, Producer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
