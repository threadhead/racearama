class CreateLaneAssignments < ActiveRecord::Migration
  def self.up
    create_table :lane_assignments do |t|
      t.integer :lane
      t.integer :scout_id
      t.integer :heat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lane_assignments
  end
end
