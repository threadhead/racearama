class AddPictureToScout < ActiveRecord::Migration
  def self.up
    add_column :scouts, :picture_file_name, :string
    add_column :scouts, :picture_content_type, :string
    add_column :scouts, :picture_file_size, :integer
    add_column :scouts, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :scouts, :picture_updated_at
    remove_column :scouts, :picture_file_size
    remove_column :scouts, :picture_content_type
    remove_column :scouts, :picture_file_name
  end
end
