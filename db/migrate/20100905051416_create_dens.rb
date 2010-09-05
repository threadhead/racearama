class CreateDens < ActiveRecord::Migration
  def self.up
    create_table :dens do |t|
      t.integer :pack_id
      t.string :den_number
      t.string :rank
      t.string :leader_name
      t.string :leader_email
      t.string :assistant_leader_name
      t.string :assistant_leader_email
      t.timestamps
    end
  end
  
  def self.down
    drop_table :dens
  end
end
