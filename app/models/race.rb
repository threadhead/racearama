class Race < ActiveRecord::Base
  belongs_to :heat
  has_many :lane_assignments, :dependent => :destroy
  
  before_save :only_one_current
  
  scope :by_index, order("order_index ASC")
  default_scope order("order_index ASC")
  
  scope :current, where(:current => true)
  scope :not_current, where(:current => false)
  scope :completed, where(:completed => true)
  scope :not_completed, where(:completed => false)
  
  def self.current_race
    self.current.first
  end
  
  def self.clear_current
    Race.update_all({:current => false}, {:current => true})
  end
  
  private
  def only_one_current
    if (self.new_record? && self.current && Race.current.exists?) ||
       (self.current && Race.current.exists? && (Race.current_race.id != self.id))
      raise ActiveRecord::ActiveRecordError, "Can not save, another current record exists."      
    end
  end
end
