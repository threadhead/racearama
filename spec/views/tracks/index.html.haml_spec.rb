require 'spec_helper'

describe "tracks/index.html.haml" do
  before(:each) do
    assign(:tracks, [
      stub_model(Track,
        :name => "Name",
        :pack_id => 1,
        :total_lanes => 1,
        :active_lanes => "Active Lanes"
      ),
      stub_model(Track,
        :name => "Name",
        :pack_id => 1,
        :total_lanes => 1,
        :active_lanes => "Active Lanes"
      )
    ])
  end

  it "renders a list of tracks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Active Lanes".to_s, :count => 2
  end
end
