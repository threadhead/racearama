class AddPictureToScout < ActiveRecord::Migration
  def change
    add_column :scouts, :picture_file_name, :string
    add_column :scouts, :picture_content_type, :string
    add_column :scouts, :picture_file_size, :integer
    add_column :scouts, :picture_updated_at, :datetime
  end

end
