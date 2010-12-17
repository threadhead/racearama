class AddCheckedInToScouts < ActiveRecord::Migration
  def self.up
    add_column :scouts, :checked_in, :boolean, :default => false
    add_index :scouts, :checked_in
  end

  def self.down
    remove_index :scouts, :checked_in
    remove_column :scouts, :checked_in
  end
end