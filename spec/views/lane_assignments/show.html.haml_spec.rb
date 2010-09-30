require 'spec_helper'

describe "lane_assignments/show.html.haml" do
  before(:each) do
    @lane_assignment = assign(:lane_assignment, stub_model(LaneAssignment,
      :lane => 1,
      :scout_id => 1,
      :heat_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
