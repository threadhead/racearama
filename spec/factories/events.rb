START_YEAR = 2012 # add 1 to desired year, factory sequences start at 1

FactoryGirl.define do
  sequence :start_time do |n|
    Time.local(START_YEAR-n,01,15,8,0,0)
  end

  sequence :end_time do |n|
    Time.local(START_YEAR-n,01,15,15,0,0)
  end

  sequence :year do |n|
    START_YEAR - n
  end

  #sets the first, or only, created Event to the active one
  sequence :active do |n|
    n == 1
  end


  factory :event do
    start_time            { FactoryGirl.generate(:start_time) }
    end_time              { FactoryGirl.generate(:end_time) }
    name                  { "Pack 134, Cave Creek, AZ - Pinewood Derby #{FactoryGirl.generate(:year)}" }
    location_name         "Desert Willow Elementary School"
    location_address1     "123 E Main St."
    location_address2     ""
    location_city         "Scottsdale"
    location_state        "AZ"
    location_zipcode      "85331"
    derby_chair           "Tracy Steward"
    race_manager          "Karl Smith"
    race_day_notes                 "ask Tracy to wear pants this year"
    track_notes                 "the track looks good and fast, lanes 1,2,11 are not functioning"
    active                { FactoryGirl.generate(:active) }

    # after(:create) do |event|
      # event.name = "Pack 134 - Pinewood Derby #{FactoryGirl.generate(:year)}"
      # event.active = FactoryGirl.generate(:active)
    # end
  end
end
