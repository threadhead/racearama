class CreateHeatGroups < ActiveRecord::Migration
  def change
    create_table :heat_groups do |t|
      t.string :name
      t.integer :event_id

      t.timestamps
    end
    add_index :heat_groups, :event_id
  end

end
