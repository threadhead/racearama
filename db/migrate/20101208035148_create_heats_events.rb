class CreateHeatsEvents < ActiveRecord::Migration
  def self.up
    create_table :heats_scouts, :id => false do |t|
      t.integer :scout_id
      t.integer :heat_id
    end
  end

  def self.down
    drop_table :heats_scouts
  end
end
