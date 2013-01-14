class AddRacesAndMethodToHeats < ActiveRecord::Migration
  def change
    add_column :heats, :races_to_generate, :integer
    add_column :heats, :generate_method, :string
    add_column :heats, :generate_time, :datetime
  end
end
