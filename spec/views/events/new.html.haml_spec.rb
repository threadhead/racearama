require 'spec_helper'

# describe "events/new.html.haml" do
#   before(:each) do
#     assign(:event, stub_model(Event,
#       :new_record? => true,
#       :name => "MyString",
#       :location_name => "MyString",
#       :location_address1 => "MyString",
#       :location_address2 => "MyString",
#       :location_city => "MyString",
#       :location_state => "MyString",
#       :location_zipcode => "MyString",
#       :derby_chair => "MyString",
#       :race_manager => "MyString",
#       :notes => "MyText",
#       :track => "MyText",
#       :active => false
#     ))
#   end
# 
#   it "renders new event form" do
#     render
# 
#     rendered.should have_selector("form", :action => events_path, :method => "post") do |form|
#       form.should have_selector("input#event_name", :name => "event[name]")
#       form.should have_selector("input#event_location_name", :name => "event[location_name]")
#       form.should have_selector("input#event_location_address1", :name => "event[location_address1]")
#       form.should have_selector("input#event_location_address2", :name => "event[location_address2]")
#       form.should have_selector("input#event_location_city", :name => "event[location_city]")
#       form.should have_selector("input#event_location_state", :name => "event[location_state]")
#       form.should have_selector("input#event_location_zipcode", :name => "event[location_zipcode]")
#       form.should have_selector("input#event_derby_chair", :name => "event[derby_chair]")
#       form.should have_selector("input#event_race_manager", :name => "event[race_manager]")
#       form.should have_selector("textarea#event_notes", :name => "event[notes]")
#       form.should have_selector("textarea#event_track", :name => "event[track]")
#       form.should have_selector("input#event_active", :name => "event[active]")
#     end
#   end
# end
