class Setting < ActiveRecord::Base
  attr_accessor :return_to
  
  #only allow saving to the current setting record
  before_destroy :can_not_destroy
  validate :only_one_setting_record
  
  def opts
    { :host => self.daq_controller_host,
      :port => self.daq_controller_port,
      :apikey => self.api_key
    }
    
  end
  
  private
  def can_not_destroy
    errors.add(:base, "You can not destroy a Setting record (notify Track Manager!)")
    return false  
  end
  
  
  def only_one_setting_record
    if self.new_record? && Setting.exists?
        # not the current setting (could be new), and setting record already exists
        errors.add(:base, "There can only be one Setting record (notify Track Manager!)")
    end
  end
  
end
