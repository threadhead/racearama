class Den < ActiveRecord::Base
  attr_accessible :pack_id, :den_number, :rank, :leader_name, :leader_email, :assistant_leader_name, :assistant_leader_email
  
  belongs_to :pack
  has_many :scouts
  
  scope :sort_den, order("den_number ASC")
  
  validates_uniqueness_of :den_number, :on => :create, :message => "there is another den with this number"
  
  def den_leader_pack
    "Den #{self.den_number} #{self.rank.pluralize}, #{self.leader_name} - #{self.pack.name}"
  end
end
