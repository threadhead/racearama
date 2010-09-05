class Den < ActiveRecord::Base
  attr_accessible :pack_id, :den_number, :rank, :leader_name, :leader_email, :assistant_leader_name, :assistant_leader_email
  
  belongs_to :pack
  
  validates_uniqueness_of :den_number, :on => :create, :message => "there is another den with this number"
end
