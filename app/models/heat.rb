class Heat < ActiveRecord::Base
  belongs_to :heat_group
  has_and_belongs_to_many :scouts, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :heat_group_id
  
  def scout_count
    @scout_count ||= self.scouts.count
  end
  
  private
end
