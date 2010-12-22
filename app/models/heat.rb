class Heat < ActiveRecord::Base
  belongs_to :heat_group
  has_many :races
  has_and_belongs_to_many :scouts, :uniq => true
  
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :heat_group_id
  
  scope :by_name, order("name ASC")
  default_scope order("name ASC")
  
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
  
  def generate_races(races_to_generate, selected_lanes)
    track = self.heat_group.event.track
    scouts = self.scouts
    scouts.shuffle!
    lane_shift = (selected_lanes.size - scouts.size) >
    
    races_to_generate.times do |n|
      a_race = self.race.build({:index => n+1})      
      hold_scout = scouts.pop
      scouts.insert(0, hold_scout) # rotates the scout array
      scouts.each do |scout|
        a_race.lane_assignment.build({:scout_id => scout.id, :lane => selected_lanes[n]})
      end
    end
  end
  
  private
end
