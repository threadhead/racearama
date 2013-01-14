FactoryGirl.define do
  factory :scout do
    first_name        { Faker::Name.first_name }
    last_name         { Faker::Name.last_name }
    address1          { Faker::Address.street_address }
    address2          ""
    city              { Faker::Address.city }
    state             { Faker::Address.state_abbr }
    zipcode           { Faker::Address.zip_code }
    parent_email1     { Faker::Internet.email }
    parent_email2     { Faker::Internet.email }
    # pack_id {|pack| pack.association(:pack)}
    association :den, :factory => :den
  end
end
