class AddRacesAndMethodToHeats < ActiveRecord::Migration
  def self.up
    add_column :heats, :races_to_generate, :integer
    add_column :heats, :generate_method, :string
    add_column :heats, :generate_time, :datetime
  end

  def self.down
    remove_column :heats, :generate_time
    remove_column :heats, :generate_method
    remove_column :heats, :generate_races
  end
end