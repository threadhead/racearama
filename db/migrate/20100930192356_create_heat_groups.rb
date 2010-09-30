class CreateHeatGroups < ActiveRecord::Migration
  def self.up
    create_table :heat_groups do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :heat_groups
  end
end
