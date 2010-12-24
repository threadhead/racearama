class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.integer :heat_id
      t.boolean :current, :default => false
      t.boolean :completed, :default => false
      t.integer :order_index, :default => 0
      
      t.timestamps
    end
    add_index :races, :heat_id
    add_index :races, :current
    add_index :races, :completed
  end

  def self.down
    remove_index :races, :completed
    remove_index :races, :current
    remove_index :races, :heat_id
    drop_table :races
  end
end