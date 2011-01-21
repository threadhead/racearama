Factory.sequence :heat_number do |n|
  n
end

Factory.sequence :heat_name do |n|
  "Heat #{n}"
end


Factory.define :heat do |p|
  p.heat_number         {Factory.next(:heat_number)}
  p.name                {Factory.next(:heat_name)}
  p.races_to_generate   {rand(5) + rand(5)}
  p.generate_method     "rotate"
  p.generate_time       {Time.now}
  p.association :heat_group, :factory => :heat_group
end
