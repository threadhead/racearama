require 'spec_helper'

describe Race do
  before(:each) do
    # pack = Factory(:pack)
    # den = Factory(:den, :pack => pack)
    # scout = Factory(:scout, :den => den)
    # @event = Factory(:event)
    # @event.scouts << scout

    @race = Factory(:race)
  end
  
  it "should be valid" do
    @race.persisted?.should be_true
  end
  
  it "should have a related heat" do
    heat = Factory(:heat)
    race = Factory(:race, :heat => heat)
    @race.heat.should be_instance_of(Heat)
  end
  
  it "should allow current to be set true" do
    lambda{@race.update_attribute(:current, true)}.should_not raise_error 
  end
  
  it "should allow new race when race marked current exists" do
    @race.update_attribute(:current, true)
    lambda{Factory(:race)}.should_not raise_error
  end
  
  it "should not allow new race with current when race marked current exists" do
    @race.update_attribute(:current, true)
    Factory.build(:race, :current => true).should raise_error
  end
  
  it "should not allow existing record to be set current when race marked current exists" do
    @race.update_attribute(:current, true)
    race = Factory(:race)
    lambda{race.update_attribute(:current, true)}.should raise_error
  end
  
  it "should allow new race when no current exists" do
    lambda{Factory(:race).should_not raise_error}
  end
end
