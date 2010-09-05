class Den < ActiveRecord::Base
  attr_accessible :pack_id, :den_number, :rank, :leader_name, :leader_email, :assistant_leader_name, :assistant_leader_email
  
  belongs_to :pack
end
