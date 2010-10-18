class Setting < ActiveRecord::Base
  #only allow saving to the current setting record
  before_destroy :can_not_destroy
  validate :only_one_setting_record
  
  private
  def can_not_destroy
    errors.add(:base, "You can not destroy a Setting record (notify Track Manager!)")
    return false  
  end
  
  
  def only_one_setting_record
    if self.new_record?
      if Setting.exists?
        # not the current setting (could be new), and setting record already exists
        errors.add(:base, "There can only be one Setting record (notify Track Manager!)")
      end

    else
      # if the current record exists, we're cool
    end
  end
  
end
