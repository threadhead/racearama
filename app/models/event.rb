class Event < ActiveRecord::Base
  has_and_belongs_to_many :scouts
  
  validates_uniqueness_of :active, :message => "there can only be one active event"
  
  # scope :current_event, where(:active => true)
  
  def has_associated?
    self.scouts.count > 0
  end
  
  def self.current_event
    Event.where(:active => true).first
  end
  
  def destroy
    if has_associated?
      raise ActiveRecord::ActiveRecordError, "Can not delete events that have associated races or scouts"
      # return false
    else
      super
    end
  end
  
end
