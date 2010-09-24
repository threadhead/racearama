class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :location_name
      t.string :location_address1
      t.string :location_address2
      t.string :location_city
      t.string :location_state
      t.string :location_zipcode
      t.string :derby_chair
      t.string :race_manager
      t.text :notes
      t.text :track
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
