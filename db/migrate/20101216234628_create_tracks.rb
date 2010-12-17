class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :name
      t.integer :pack_id
      t.integer :total_lanes
      t.string :active_lanes

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
