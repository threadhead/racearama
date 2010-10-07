require 'spec_helper'

# describe "races/edit.html.haml" do
#   before(:each) do
#     @race = assign(:race, stub_model(Race,
#       :new_record? => false,
#       :line_number => 1,
#       :lane_id => 1,
#       :elapsed_seconds => 1.5
#     ))
#   end
# 
#   it "renders the edit race form" do
#     render
# 
#     rendered.should have_selector("form", :action => race_path(@race), :method => "post") do |form|
#       form.should have_selector("input#race_line_number", :name => "race[line_number]")
#       form.should have_selector("input#race_lane_id", :name => "race[lane_id]")
#       form.should have_selector("input#race_elapsed_seconds", :name => "race[elapsed_seconds]")
#     end
#   end
# end
