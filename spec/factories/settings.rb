FactoryGirl.define do
  factory :setting do
    daq_controller_host      "localhost"
    daq_controller_port      "8011"
    api_key                  "development"
  end
end
