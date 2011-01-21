Factory.sequence :order_index do |n|
  n
end

Factory.define :race do |p|
  p.current           false
  p.completed         false
  p.order_index       {Factory.next(:order_index)}
  p.association :heat, :factory => :heat
end
