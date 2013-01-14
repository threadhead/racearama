FactoryGirl.define do
  sequence :order_index do |n|
    n
  end

  factory :race do
    current           false
    completed         false
    order_index       { FactoryGirl.generate(:order_index) }

    association :heat, :factory => :heat
  end
end
