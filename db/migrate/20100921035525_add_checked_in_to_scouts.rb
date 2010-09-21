class AddCheckedInToScouts < ActiveRecord::Migration
  def self.up
    add_column :scouts, :checked_in, :boolean
  end

  def self.down
    remove_column :scouts, :checked_in
  end
end
