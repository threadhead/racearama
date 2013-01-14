require File.dirname(__FILE__) + '/../spec_helper'

describe Pack do
  before(:each) do
    @pack = FactoryGirl.create(:pack)
    den1 = FactoryGirl.create(:den, :pack => @pack)
    den2 = FactoryGirl.create(:den, :den_number => "1", :pack => @pack)
  end

  it "should be valid" do
    @pack.should be_valid
  end

  it "should have 2 dens" do
    @pack.dens.count.should eql(2)
  end
end
