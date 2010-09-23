# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "Removing all data from: Users, Packs, Dens, Scouts"
User.destroy_all
Pack.destroy_all
Den.destroy_all
Scout.destroy_all

puts "Creating manager logins: Check In, Car Staging, Track Manager"
User.create({
  :email => "threadhead@gmail.com",
  :username => "check_in",
  :password => "pack134"
})

User.create({
  :email => "threadhead@gmail.com",
  :username => "track_manager",
  :password => "134pack"
})

User.create({
  :email => "threadhead@gmail.com",
  :username => "car_staging",
  :password => "pack134"
})

# generate one pack

puts "Creating a seed pack"
@pack = Factory.create(:pack)

# generate 12 dens for this pack
puts "..Adding 12 Dens to the seed Pack"
dens = []
12.times { dens << Factory(:den, 
                           :leader_name => Faker::Name.name,
                           :assistant_leader_name => Faker::Name.name,
                           :pack => @pack) }

#generate 100 scouts in random dens
puts "..Adding 100 scouts to Dens"
100.times { Factory(:scout,
                    :den => dens[rand(10)]) }