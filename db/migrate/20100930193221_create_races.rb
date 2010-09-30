class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.integer :lane
      t.integer :lane_id
      t.float :elapsed_seconds

      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
