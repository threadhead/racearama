class MoveSettingsIntoTracks < ActiveRecord::Migration
  def change
    drop_table :settings

    add_column :tracks, :controller_host, :string, default: 'localhost'
    add_column :tracks, :controller_port, :string, default: '8011'
    add_column :tracks, :api_key, :string, default: 'development'
  end

end
