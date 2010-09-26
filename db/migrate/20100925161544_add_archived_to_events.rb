class AddArchivedToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :archived, :boolean
  end

  def self.down
    remove_column :events, :archived
  end
end
