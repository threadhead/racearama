class AddTrackToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :track_id, :integer
    add_index :events, :track_id
  end

  def self.down
    remove_index :events, :track_id
    remove_column :events, :track_id
  end
end