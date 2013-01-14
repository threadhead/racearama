class HeatGroup < ActiveRecord::Base
  belongs_to :event
  has_many :heats

  scope :by_name, order("name ASC")
  default_scope order("name ASC")

  validates_presence_of :name
end
