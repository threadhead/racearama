FactoryGirl.define do
  sequence :den_number do |n|
    "#{n}"
  end

  sequence :rank do |r|
    ["Tiger", "Wolf", "Bear", "Webelo 1", "Webelo 2"][rand(5)]
  end

  factory :den do
    den_number               { FactoryGirl.generate(:den_number) }
    rank                     { FactoryGirl.generate(:rank) }
    leader_name              "Karl Smith"
    leader_email             "threadhead@gmail.com"
    assistant_leader_name    "John Bartholomew"
    assistant_leader_email   "threadhead@gmail.com"
    # pack_id {|pack| pack.association(:pack)}
    association :pack, :factory => :pack
  end
end
