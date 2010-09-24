class Scout < ActiveRecord::Base
  attr_accessible :den_id, :first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :parent_email1, :parent_email2, :picture
  
  validates_presence_of :first_name, :last_name
  validates_presence_of :den_id, :message => "must select a den"
  
  belongs_to :den
  has_and_belongs_to_many :events
  
  has_attached_file :picture, :styles => {:thumb => "100x100>"}, :default_url => "missing.png"
  
  scope :not_checked_in, where(:checked_in => false)
  scope :checked_in, where(:checked_in => true)
  scope :sort_fl_name, order("first_name ASC, last_name ASC")
  scope :sort_lf_name, order("last_name ASC, first_name ASC")
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def self.number_checked_in
    Scout.checked_in.count
  end
end
