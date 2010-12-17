class CreateHeatGroups < ActiveRecord::Migration
  def self.up
    create_table :heat_groups do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
    add_index :heat_groups, :event_id
  end

  def self.down
    remove_index :heat_groups, :event_id
    drop_table :heat_groups
  end
end