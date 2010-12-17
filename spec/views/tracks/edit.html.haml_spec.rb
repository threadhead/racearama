require 'spec_helper'

describe "tracks/edit.html.haml" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :name => "MyString",
      :pack_id => 1,
      :total_lanes => 1,
      :active_lanes => "MyString"
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => track_path(@track), :method => "post" do
      assert_select "input#track_name", :name => "track[name]"
      assert_select "input#track_pack_id", :name => "track[pack_id]"
      assert_select "input#track_total_lanes", :name => "track[total_lanes]"
      assert_select "input#track_active_lanes", :name => "track[active_lanes]"
    end
  end
end
