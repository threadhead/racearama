class CreateLaneAssignments < ActiveRecord::Migration
  def self.up
    create_table :lane_assignments do |t|
      t.integer :lane
      t.integer :scout_id
      t.integer :race_id

      t.timestamps
    end
    add_index :lane_assignments, :race_id
  end

  def self.down
    remove_index :lane_assignments, :race_id
    drop_table :lane_assignments
  end
end