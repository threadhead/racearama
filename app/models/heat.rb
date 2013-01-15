class Heat < ActiveRecord::Base
  belongs_to :heat_group
  has_many :races, :dependent => :destroy
  has_and_belongs_to_many :scouts, :uniq => true
  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :heat_group_id

  scope :by_name, order("heats.name ASC")
  default_scope order("heats.name ASC")



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
    # we would like to move cars to the center of the track if possible
    lane_shift = (selected_lanes.size - scouts.size) > 1 ? 1 : 0

    races_to_generate.to_i.times do |n|
      a_race = Race.new({:order_index => (n+1)})
      self.races << a_race
      scouts = rotate_scouts(scouts)
      scouts.each_with_index do |scout, idx|
        a_race.lane_assignments << LaneAssignment.new(
          {:scout_id => scout.id, :lane => selected_lanes[idx + lane_shift].to_i}
        )
      end
      a_race.save
    end
  end


  def has_completed_races?
    self.races.where(:completed => true).count > 0
  end


  def has_current_race?
    self.races.where(:current => true).count > 0
  end


  def has_races?
    self.races.count > 0
  end


  def self.ready_to_race(event)
    # event.heat_groups.map{|g| g.heats}.flatten.keep_if{|h| h.has_races?}
    event_heats = Heat.includes(heat_group: :event).where('events.active' => true)
    event_heats.keep_if{|h| h.has_races?}
  end


  private
  def rotate_scouts(scouts_array)
    hold_scout = scouts_array.pop
    scouts_array.insert(0, hold_scout)
    return scouts_array
  end
end
