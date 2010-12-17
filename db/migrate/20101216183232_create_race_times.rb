class CreateRaceTimes < ActiveRecord::Migration
  def self.up
    create_table :race_times do |t|
      t.integer :lane
      t.integer :lane_id
      t.float :elapsed_seconds

      t.timestamps
    end
  end

  def self.down
    drop_table :race_times
  end
end
