FactoryGirl.define do
  sequence :heat_number do |n|
    n
  end

  sequence :heat_name do |n|
    "Heat #{n}"
  end

  factory :heat do
    heat_number         { FactoryGirl.generate(:heat_number) }
    name                { FactoryGirl.generate(:heat_name) }
    races_to_generate   { rand(5) + rand(5) }
    generate_method     "rotate"
    generate_time       { Time.now }

    association :heat_group, :factory => :heat_group
  end
end
