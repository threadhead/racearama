class AddArchivedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :archived, :boolean
  end

end
