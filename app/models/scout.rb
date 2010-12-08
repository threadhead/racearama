class Scout < ActiveRecord::Base
  attr_accessible :den_id, :first_name, :last_name, :address1, :address2, :city, :state, :zipcode, :parent_email1, :parent_email2, :picture
  
  validates_presence_of :first_name, :last_name
  validates_presence_of :den_id, :message => "must select a den"
  
  belongs_to :den
  has_and_belongs_to_many :events
  has_and_belongs_to_many :heats, :uniq => true
  
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
  
  def self.search_names(name, event=nil)
    like_param = "%" + name + "%"
    if event
      event.scouts.where("first_name LIKE ? OR last_name LIKE ?", like_param, like_param).includes(:den).sort_fl_name.all
    else
      Scout.where("first_name LIKE ? OR last_name LIKE ?", like_param, like_param).includes(:den).sort_fl_name.all
    end
  end
  
  def in_another_heat?(event)
    heat_groups = event.heat_groups
    heat_groups.each do |heat_group|
      heats = heat_group.heats
      heats.each do |heat|
        return true if heat.scouts.exists?(self)
      end
    end
    return false
  end
  
  def has_event?(event)
    self.events.where( :id => event.id ).count > 0
  end
  
  def has_current_event?
    current_event = Event.current_event
    if current_event
      self.events.where( :id => current_event.id ).count > 0
    else
      return false
    end
  end
  
  
end
