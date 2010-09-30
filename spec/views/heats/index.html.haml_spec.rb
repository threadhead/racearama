require 'spec_helper'

describe "heats/index.html.haml" do
  before(:each) do
    assign(:heats, [
      stub_model(Heat,
        :heat_group_id => 1,
        :heat_number => 1
      ),
      stub_model(Heat,
        :heat_group_id => 1,
        :heat_number => 1
      )
    ])
  end

  it "renders a list of heats" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
