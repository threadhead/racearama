FactoryGirl.define do
  sequence :track_name do |n|
    ["Aluminum", "Wood", "Plastic"][rand(3)]
  end

  sequence :total_lanes do |n|
    [12, 4, 3][n-1]
  end

  sequence :available_lanes do |n|
    ["2,3,4,5,6,8,9,11", "1,3,4", "1,3"][n-1]
  end

  factory :track do
    name               { FactoryGirl.generate(:track_name) }
    total_lanes        { FactoryGirl.generate(:total_lanes) }
    active_lanes       { FactoryGirl.generate(:available_lanes) }
    controller_host    "localhost"
    controller_port    "8011"
    api_key            "development"

    association :pack, :factory => :pack
  end
end
