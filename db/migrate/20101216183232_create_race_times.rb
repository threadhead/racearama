class CreateRaceTimes < ActiveRecord::Migration
  def change
    create_table :race_times do |t|
      t.integer :race_id
      t.integer :lane
      t.integer :lane_id
      t.float :elapsed_seconds

      t.timestamps
    end

    add_index :race_times, :race_id
    add_index :race_times, :lane
  end

end
