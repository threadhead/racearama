class AddEventsScoutsHabtm < ActiveRecord::Migration
  def change
    create_table :events_scouts, :id => false do |t|
      t.integer :scout_id
      t.integer :event_id
    end
  end

end
