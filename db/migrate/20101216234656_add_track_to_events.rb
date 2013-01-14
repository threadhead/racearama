class AddTrackToEvents < ActiveRecord::Migration
  def change
    add_column :events, :track_id, :integer
    add_index :events, :track_id
  end

end
