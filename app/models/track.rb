class Track < ActiveRecord::Base
  has_many :events
  belongs_to :pack

  attr_accessible :name, :pack_id, :total_lanes, :active_lanes

  validates_numericality_of :total_lanes
  validates_presence_of :total_lanes
  validates_presence_of :name

  def name_pack
    "#{self.name}-#{self.pack.name}"
  end

  def name_lanes
    "#{self.name}-#{self.total_lanes} lanes"
  end

  def active_lanes_count
    self.active_lanes.split(",").size
  end
end
