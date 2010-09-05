class Pack < ActiveRecord::Base
  attr_accessible :name, :address1, :address2, :city, :state, :zipcode, :cubmaster_name, :pinewood_derby_chair, :website_url, :email
end
