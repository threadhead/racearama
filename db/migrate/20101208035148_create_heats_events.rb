class CreateHeatsEvents < ActiveRecord::Migration
  def change
    create_table :heats_scouts, :id => false do |t|
      t.integer :scout_id
      t.integer :heat_id
    end
  end
end
