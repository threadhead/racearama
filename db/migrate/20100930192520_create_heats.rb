class CreateHeats < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.integer :heat_group_id
      t.integer :heat_number

      t.timestamps
    end
    add_index :heats, :heat_group_id
  end

end
