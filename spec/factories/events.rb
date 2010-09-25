START_YEAR = 2012 # add 1 to desired year, factory sequences start at 1

Factory.sequence :start_time do |n|
  Time.local(START_YEAR-n,01,15,8,0,0)
end

Factory.sequence :end_time do |n|
  Time.local(START_YEAR-n,01,15,15,0,0)
end

Factory.sequence :year do |n|
  START_YEAR - n
end

#sets the first, or only, created Event to the active one
Factory.sequence :active do |n|
  n == 1
end


Factory.define :event do |p|
  p.start_time            {Factory.next(:start_time)}
  p.end_time              {Factory.next(:end_time)}
  # p.name                  "Pack 134, Cave Creek, AZ - Pinewood Derby #{Factory.next(:year)}"
  p.location_name         "Desert Willow Elementary School"
  p.location_address1     "123 E Main St."
  p.location_address2     ""
  p.location_city         "Scottsdale"
  p.location_state        "AZ"
  p.location_zipcode      "85331"
  p.derby_chair           "Tracy Steward"
  p.race_manager          "Karl Smith"
  p.notes                 "ask Tracy to wear pants this year"
  p.track                 "the track looks good and fast, lanes 1,2,11 are not functioning"
  p.active                {Factory.next(:active)}
  
  p.after_build do |event|
    event.name = "Pack 134 - Pinewood Derby #{Factory.next(:year)}"
    # event.active = Factory.next(:active)
  end
end