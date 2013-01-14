class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :cubmaster_name
      t.string :pinewood_derby_chair
      t.string :website_url
      t.string :email
      t.timestamps
    end
  end

end
