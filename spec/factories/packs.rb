Factory.sequence :name do |n|
  "Pack #{n}"
end
Factory.define :pack do |p|
  p.name              "Pack 134"
  p.address1          "123 E Main St"
  p.city              "Cave Creek"
  p.state             "AZ"
  p.zipcode           "85331"
  p.cubmaster_name    "Rob Madden"
  p.website_url       "http://pack134az.com"
  p.email             "threadhead@gmail.com"
end