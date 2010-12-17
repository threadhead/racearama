class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.integer :heat_id
      t.boolean :current
      t.boolean :completed
      t.integer :index
      
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