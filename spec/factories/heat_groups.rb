Factory.sequence :name do |r|
  ["Tigers", "Wolves", "Bears", "Webelos1", "Webelos2"][r]
end

Factory.define :heat_group do |p|
  p.name               {Factory.next(:name)}
  p.association :event, :factory => :event
end