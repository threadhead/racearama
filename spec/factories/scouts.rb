Factory.define :scout do |p|
  p.first_name        {Faker::Name.first_name}
  p.last_name         {Faker::Name.last_name}
  p.address1          {Faker::Address.street_address}
  p.address2          ""
  p.city              {Faker::Address.city}
  p.state             {Faker::Address.us_state_abbr}
  p.zipcode           {Faker::Address.zip_code}
  p.parent_email1     {Faker::Internet.email}
  p.parent_email2     {Faker::Internet.email}
  # p.pack_id {|pack| pack.association(:pack)}
  p.association :den, :factory => :den
end