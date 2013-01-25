class LaneAssignment < ActiveRecord::Base
  belongs_to :race
  belongs_to :scout

  attr_accessible :scout_id, :lane
end
