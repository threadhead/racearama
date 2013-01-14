class AddHabtmIndexes < ActiveRecord::Migration
  def change
    add_index :events_scouts, [:event_id, :scout_id]
    add_index :heats_scouts, [:heat_id, :scout_id]
  end
end
