class AddNameToHeats < ActiveRecord::Migration
  def self.up
    add_column :heats, :name, :string
  end

  def self.down
    remove_column :heats, :name
  end
end
