Factory.sequence :name do |n|
  ["Aluminum", "Wood", "Plastic"][n]
end

Factory.sequence :total_lanes do |n|
  [12, 4, 3][n]
end

Factory.sequence :available_lanes do |n|
  ["2,3,4,5,6,8,9,11", "1,3,4", "1,3"][n]
end

Factory.define :track do |p|
  p.name               {Factory.next(:name)}
  p.total_lanes        {Factory.next(:total_lanes)}
  p.active_lanes       {Factory.next(:available_lanes)}
  p.association :pack, :factory => :pack
end