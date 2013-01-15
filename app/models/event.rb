class Event < ActiveRecord::Base
  belongs_to :track
  has_and_belongs_to_many :scouts
  has_many :heat_groups

  attr_accessible :track_id, :name, :start_time, :end_time, :location_name, :location_address1, :location_address2, :location_city, :location_state, :location_zipcode, :derby_chair, :race_manager, :race_day_notes, :track_notes

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
