require 'spec_helper'

describe Race do
  before(:each) do
    # pack = Factory(:pack)
    # den = Factory(:den, :pack => pack)
    # scout = Factory(:scout, :den => den)
    # @event = Factory(:event)
    # @event.scouts << scout

    @race = FactoryGirl.create(:race)
  end

  it "should be valid" do
    @race.persisted?.should be_true
  end

  it "should have a related heat" do
    heat = FactoryGirl.create(:heat)
    race = FactoryGirl.create(:race, :heat => heat)
    @race.heat.should be_instance_of(Heat)
  end

  it "should allow current to be set true" do
    expect { @race.update_attribute(:current, true) }.to_not raise_error
  end

  it "should allow new race when race marked current exists" do
    @race.update_attribute(:current, true)
    expect { FactoryGirl.create(:race) }.to_not raise_error
  end

  it "should not allow new race with current when race marked current exists" do
    @race.update_attribute(:current, true)
    expect { FactoryGirl.build(:race, :current => true).save }.to raise_error
  end

  it "should not allow existing record to be set current when race marked current exists" do
    @race.update_attribute(:current, true)
    race = FactoryGirl.create(:race)
    expect { race.update_attribute(:current, true) }.to raise_error
  end

  it "should allow new race when no current exists" do
    expect { FactoryGirl.create(:race) }.to_not raise_error
  end
end
