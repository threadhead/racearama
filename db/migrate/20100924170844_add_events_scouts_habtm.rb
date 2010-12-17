class AddEventsScoutsHabtm < ActiveRecord::Migration
  def self.up
    create_table :events_scouts, :id => false do |t|
      t.integer :scout_id
      t.integer :event_id
    end
  end

  def self.down
    drop_table :events_scouts
  end
end