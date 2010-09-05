# namespace :db do
#   desc "add fake kids to the datbase"
#   task :add_fake_kids do
#     require 'factory_girl'
#     require 'faker'
#     Dir[Rails.root.join("spec/factories/*.rb")].each {|f| require f}
#     Factory.find_definitions
#     
#         
#     # generate one pack
#     
#     @pack = Factory.create(:pack)
#     
#     # generate 12 dens for this pack
#     12.times { Factory(:dens, 
#                        :leader_name => Faker::Name.name,
#                        :assistant_leader_name => Faker::Name.name,
#                        :pack => @pack) }
#   end
# end
