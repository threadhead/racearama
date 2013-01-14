class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.integer :heat_id
      t.boolean :current, :default => false
      t.boolean :completed, :default => false
      t.integer :order_index, :default => 0
      t.float   :daq_seconds, :default => 0.0

      t.timestamps
    end
    add_index :races, :heat_id
    add_index :races, :current
    add_index :races, :completed
  end

end
