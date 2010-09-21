class Scout < ActiveRecord::Base
  attr_accessible :den_id, :first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :parent_email1, :parent_email2
  
  belongs_to :den
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
