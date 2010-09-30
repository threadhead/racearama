require 'spec_helper'

describe "races/new.html.haml" do
  before(:each) do
    assign(:race, stub_model(Race,
      :new_record? => true,
      :line_number => 1,
      :lane_id => 1,
      :elapsed_seconds => 1.5
    ))
  end

  it "renders new race form" do
    render

    rendered.should have_selector("form", :action => races_path, :method => "post") do |form|
      form.should have_selector("input#race_line_number", :name => "race[line_number]")
      form.should have_selector("input#race_lane_id", :name => "race[lane_id]")
      form.should have_selector("input#race_elapsed_seconds", :name => "race[elapsed_seconds]")
    end
  end
end
