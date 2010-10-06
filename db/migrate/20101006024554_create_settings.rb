class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :timer_service_ip
      t.string :timer_service_port

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
