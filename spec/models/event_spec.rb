require 'spec_helper'

describe Event do
  before(:each) do
    pack = Factory(:pack)
    den = Factory(:den, :pack => pack)
    scout = Factory(:scout, :den => den)
    @event = Factory(:event)
    @event.scouts << scout
  end
  
  it "should be valid" do
    @event.should be_valid
  end
  
  it "should have a related scout" do
    @event.scouts.count.should eql(1)
  end
  
  it "should return true when it has associated scouts" do
    @event.has_associated?.should be_true
  end
  
  it "should return false when it has no associated scout" do
    @event.scouts.clear
    @event.has_associated?.should be_false
  end
  
  it "should find the current_event if available" do
    @event2 = Factory(:event, :active => true)
    Event.current_event.should be_instance_of(Event)
    Event.current_event.should_not be_nil
  end
  
  it "should not be destroyed if related scouts exist" do
    lambda{@event.destroy}.should raise_error(ActiveRecord::ActiveRecordError)
  end
  
  it "should be destroyed if no related scouts exist" do
    @event.scouts.clear
    lambda{@event.destroy}.should_not raise_error
  end
  
  it "should not be able to create a new, active event if one already exists" do
    Factory(:event, :active => true)
    Factory.build(:event, :active => true).should_not be_valid
  end
  
end
