class AddCheckedInToScouts < ActiveRecord::Migration
  def change
    add_column :scouts, :checked_in, :boolean, :default => false
    add_index :scouts, :checked_in
  end

end
