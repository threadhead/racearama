class Race < ActiveRecord::Base
  belongs_to :heat
  has_many :lane_assignments, :dependent => :destroy
  
  scope :by_index, order("order_index ASC")
  default_scope order("order_index ASC")
  
  scope :current, where(:current => true)
  scope :not_current, where(:current => false)
  scope :completed, where(:completed => true)
  scope :not_completed, where(:completed => false)
  
end
