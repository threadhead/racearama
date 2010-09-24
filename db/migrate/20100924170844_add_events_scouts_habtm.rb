class AddEventsScoutsHabtm < ActiveRecord::Migration
  def self.up
    create_table :scouts_events, :id => false do |t|
      t.integer :scout_id
      t.integer :event_id
    end
    
  end

  def self.down
    drop_table :scouts_events
  end
end
