require 'spec_helper'

describe "events/show.html.haml" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "Name",
      :location_name => "Location Name",
      :location_address1 => "Location Address1",
      :location_address2 => "Location Address2",
      :location_city => "Location City",
      :location_state => "Location State",
      :location_zipcode => "Location Zipcode",
      :derby_chair => "Derby Chair",
      :race_manager => "Race Manager",
      :notes => "MyText",
      :track => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Location Name".to_s)
    rendered.should contain("Location Address1".to_s)
    rendered.should contain("Location Address2".to_s)
    rendered.should contain("Location City".to_s)
    rendered.should contain("Location State".to_s)
    rendered.should contain("Location Zipcode".to_s)
    rendered.should contain("Derby Chair".to_s)
    rendered.should contain("Race Manager".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
  end
end
