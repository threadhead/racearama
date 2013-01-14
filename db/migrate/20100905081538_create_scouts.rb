class CreateScouts < ActiveRecord::Migration
  def change
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
    add_index :scouts, :den_id
  end

end
