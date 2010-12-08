class AddHabtmIndexes < ActiveRecord::Migration
  def self.up
    add_index :events_scouts, [:event_id, :scout_id]
    add_index :heats_scouts, [:heat_id, :scout_id]
  end

  def self.down
    remove_index :events_scouts, [:event_id, :scout_id]
    remove_index :heats_scouts, [:heat_id, :scout_id]
  end
end
