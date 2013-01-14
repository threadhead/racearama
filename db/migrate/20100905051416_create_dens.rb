class CreateDens < ActiveRecord::Migration
  def change
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
    add_index :dens, :pack_id
  end
end
