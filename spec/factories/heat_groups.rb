FactoryGirl.define do
  sequence :heat_group_name do |r|
    ["Tigers", "Wolves", "Bears", "Webelos1", "Webelos2"][(r-1)%5]
  end

  factory :heat_group do
    name               { FactoryGirl.generate(:heat_group_name) }
    association :event, :factory => :event
  end
end
