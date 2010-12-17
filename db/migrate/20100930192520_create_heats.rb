class CreateHeats < ActiveRecord::Migration
  def self.up
    create_table :heats do |t|
      t.integer :heat_group_id
      t.integer :heat_number

      t.timestamps
    end
    add_index :heats, :heat_group_id
  end

  def self.down
    remove_index :heats, :heat_group_id
    drop_table :heats
  end
end