class Track < ActiveRecord::Base
  has_many :events
  belongs_to :pack

  attr_accessible :name, :pack_id, :total_lanes, :active_lanes, :controller_host, :controller_port, :api_key

  validates_numericality_of :total_lanes
  validates_presence_of :total_lanes
  validates_presence_of :name

  def name_pack
    "#{self.name}-#{self.pack.name}"
  end

  def name_lanes
    "#{self.name} - #{self.total_lanes} lanes"
  end

  def name_pack_lanes
    "#{self.name} - #{self.pack.name}: #{self.total_lanes} lanes"
  end

  def active_lanes_count
    self.active_lanes.split(",").size
  end

  def opts
    {
      :host => self.controller_host,
      :port => self.controller_port,
      :apikey => self.api_key
    }
  end
end
