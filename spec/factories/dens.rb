Factory.sequence :den_number do |n|
  "#{n}"
end

Factory.sequence :rank do |r|
  %w{Tiger Wolf Bear WebeloI WebeloII}[rand(5)]
end

Factory.define :den do |p|
  p.den_number               {Factory.next(:den_number)}
  p.rank                     {Factory.next(:rank)}
  p.leader_name              "Karl Smith"
  p.leader_email             "threadhead@gmail.com"
  p.assistant_leader_name    "John Bartholomew"
  p.assistant_leader_email   "threadhead@gmail.com"
  # p.pack_id {|pack| pack.association(:pack)}
  p.association :pack, :factory => :pack
end