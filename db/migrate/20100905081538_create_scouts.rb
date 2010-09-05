class CreateScouts < ActiveRecord::Migration
  def self.up
    create_table :scouts do |t|
      t.integer :den_id
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :parent_email1
      t.string :parent_email2
      t.timestamps
    end
  end
  
  def self.down
    drop_table :scouts
  end
end
