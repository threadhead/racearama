require 'spec_helper'

describe Setting do
  before(:each) do
    @setting = Factory(:setting)
  end
  
  it "should be able to edit existing" do
    @setting.update_attributes(:daq_controller_host => "192.168.0.2").should be_valid
  end
  
  it "should not be able to add more than one record" do
    
  end
  
  # it "should be associated with a pack" do
  #   @den.pack.name.should eql("Pack 134")
  # end
  # 
  # it "should not have same den numbers" do
  #   Factory.build(:den, :den_number => @den.den_number).should_not be_valid
  # end
end
