class HeatGroup < ActiveRecord::Base
  belongs_to :event
  has_many :heats
end
