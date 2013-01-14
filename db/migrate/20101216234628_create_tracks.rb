class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :pack_id
      t.integer :total_lanes
      t.string :active_lanes

      t.timestamps
    end
  end

end
