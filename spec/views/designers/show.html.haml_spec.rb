require 'rails_helper'

RSpec.describe "designers/show", type: :view do
  before(:each) do
    @designer = assign(:designer, Designer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
