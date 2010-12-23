class Race < ActiveRecord::Base
  belongs_to :heat
  has_many :lane_assignments, :dependent => :destroy
end
