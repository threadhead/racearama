class Track < ActiveRecord::Base
  has_many :events
  belongs_to :pack
  
  validates_numericality_of :total_lanes
  validates_presence_of :total_lanes
  validates_presence_of :name
  
  def name_pack
    "#{self.name}-#{self.pack.name}"
  end
  
  def name_lanes
    "#{self.name}-#{self.total_lanes} lanes"
  end
end
