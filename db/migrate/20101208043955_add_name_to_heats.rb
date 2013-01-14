class AddNameToHeats < ActiveRecord::Migration
  def change
    add_column :heats, :name, :string
  end
end
