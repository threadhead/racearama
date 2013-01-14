class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :daq_controller_host
      t.string :daq_controller_port
      t.string :api_key

      t.timestamps
    end
    unless Rails.env == "test"
      Setting.create({:daq_controller_host => "localhost",
                      :daq_controller_port => "8011",
                      :api_key => "77asdf77"})
    end
  end
end
