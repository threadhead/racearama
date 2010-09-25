class Event < ActiveRecord::Base
  has_and_belongs_to_many :scouts
  
  validates_uniqueness_of :active, :message => "there can only be one active event"
  
  scope :current_event, where(:active => true)
  
end
