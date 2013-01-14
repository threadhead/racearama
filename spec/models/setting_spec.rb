require 'spec_helper'

describe Setting do
  before(:each) do
    @setting = FactoryGirl.create(:setting)
  end

  it "should be able to edit existing" do
    @setting.update_attribute(:daq_controller_host, "192.168.0.2")
    @setting.should be_valid
  end

  it "should not be able to add more than one record" do
    @setting2 = FactoryGirl.build(:setting).should_not be_valid
    # @setting2.should not_be_valid
  end

  it "should not be able to destroy the only setting record" do
    @setting.destroy.should be_false
  end
end
