FactoryGirl.define do
  sequence :name do |n|
    "Pack #{n}"
  end

  factory :pack do
    name              "Pack 134"
    address1          "123 E Main St"
    city              "Cave Creek"
    state             "AZ"
    zipcode           "85331"
    cubmaster_name    "Rob Madden"
    website_url       "http://pack134az.com"
    email             "threadhead@gmail.com"
  end
end
