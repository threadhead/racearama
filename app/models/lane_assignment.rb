class LaneAssignment < ActiveRecord::Base
  belongs_to :race
  belongs_to :scout
end
