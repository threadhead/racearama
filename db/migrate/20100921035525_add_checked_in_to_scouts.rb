class AddCheckedInToScouts < ActiveRecord::Migration
  def self.up
    add_column :scouts, :checked_in, :boolean, :default => false
  end

  def self.down
    remove_column :scouts, :checked_in
  end
end
