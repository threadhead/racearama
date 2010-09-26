require 'spec_helper'

# describe "events/index.html.haml" do
#   before(:each) do
#     assign(:events, [
#       stub_model(Event,
#         :name => "Name",
#         :location_name => "Location Name",
#         :location_address1 => "Location Address1",
#         :location_address2 => "Location Address2",
#         :location_city => "Location City",
#         :location_state => "Location State",
#         :location_zipcode => "Location Zipcode",
#         :derby_chair => "Derby Chair",
#         :race_manager => "Race Manager",
#         :notes => "MyText",
#         :track => "MyText",
#         :active => false
#       ),
#       stub_model(Event,
#         :name => "Name",
#         :location_name => "Location Name",
#         :location_address1 => "Location Address1",
#         :location_address2 => "Location Address2",
#         :location_city => "Location City",
#         :location_state => "Location State",
#         :location_zipcode => "Location Zipcode",
#         :derby_chair => "Derby Chair",
#         :race_manager => "Race Manager",
#         :notes => "MyText",
#         :track => "MyText",
#         :active => false
#       )
#     ])
#   end
# 
#   it "renders a list of events" do
#     render
#     rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location Name".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location Address1".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location Address2".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location City".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location State".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Location Zipcode".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Derby Chair".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "Race Manager".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
#     rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
#   end
# end
