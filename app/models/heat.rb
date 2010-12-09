class Heat < ActiveRecord::Base
  belongs_to :heat_group
  has_and_belongs_to_many :scouts, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :heat_group_id
  
  def scout_count
    @scout_count ||= self.scouts.count
  end

  def add_scout_by_ids(scout_ids)
    scout_ids.each do |id|
      scout = Scout.find_by_id(id)
      add_scout(scout) if scout
    end
  end
  
  def add_scout(scout)
    unless self.scouts.exists?(scout)
      self.scouts << scout
    end
  end
  
  private
end
