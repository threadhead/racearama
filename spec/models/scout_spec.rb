require File.dirname(__FILE__) + '/../spec_helper'

describe Scout do
  before(:each) do
    pack = Factory(:pack)
    den = Factory(:den, :pack => pack)
    @scout = Factory(:scout, :den => den)
  end
  
  
  it "should be valid" do
    @scout.should be_valid
  end
  
  it "full_name returns last + first name" do
    @scout.full_name.should eql("#{@scout.first_name} #{@scout.last_name}")
  end
end
