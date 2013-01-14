class CreateLaneAssignments < ActiveRecord::Migration
  def change
    create_table :lane_assignments do |t|
      t.integer :lane
      t.integer :scout_id
      t.integer :race_id

      t.timestamps
    end
    add_index :lane_assignments, :race_id
  end

end
