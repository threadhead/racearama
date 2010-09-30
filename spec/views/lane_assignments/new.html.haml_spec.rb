require 'spec_helper'

describe "lane_assignments/new.html.haml" do
  before(:each) do
    assign(:lane_assignment, stub_model(LaneAssignment,
      :new_record? => true,
      :lane => 1,
      :scout_id => 1,
      :heat_id => 1
    ))
  end

  it "renders new lane_assignment form" do
    render

    rendered.should have_selector("form", :action => lane_assignments_path, :method => "post") do |form|
      form.should have_selector("input#lane_assignment_lane", :name => "lane_assignment[lane]")
      form.should have_selector("input#lane_assignment_scout_id", :name => "lane_assignment[scout_id]")
      form.should have_selector("input#lane_assignment_heat_id", :name => "lane_assignment[heat_id]")
    end
  end
end
