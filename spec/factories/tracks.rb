Factory.sequence :name do |r|
  ["Aluminum", "Wood", "Plastic"][rand(3)]
end

Factory.sequence :total_lanes do |r|
  [12, 4, 3][n]
end

Factory.sequence :available_lanes do |r|
  ["2,3,4,5,6,8,9,11", "1,3,4", "1,3"][n]
end

Factory.define :track do |p|
  p.name               {Factory.next(:name)}
  p.total_lanes        {Factory.next(:total_lanes)}
  p.active_lanes       {Factory.next(:available_lanes)}
  p.association :pack, :factory => :pack
end