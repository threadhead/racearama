class Event < ActiveRecord::Base
  belongs_to :track
  has_and_belongs_to_many :scouts
  has_many :heat_groups

  # validate :only_one_active_event
  validates_presence_of :name

  # scope :current_event, where(:active => true)

  def has_associated?
    self.scouts.count > 0
  end

  def self.current_event
    Event.where(:active => true).first
  end

  def self.active_event?
    Event.where(:active => true).count >= 1
  end

  def destroy
    if has_associated?
      raise ActiveRecord::ActiveRecordError, "Can not delete events that have associated races or scouts"
      # return false
    else
      super
    end
  end

  private
  def only_one_active_event
    if self.active && (Event.current_event.id != self.id)
      errors.add(:base, "Events can have only one active event")
    end
  end

end
