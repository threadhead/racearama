require File.dirname(__FILE__) + '/../spec_helper'

describe Den do
  before(:each) do
    pack = FactoryGirl.create(:pack)
    @den = FactoryGirl.create(:den, :pack => pack)
  end

  it "should be valid" do
    @den.should be_valid
  end

  it "should be associated with a pack" do
    @den.pack.name.should eql("Pack 134")
  end

  it "should not have same den numbers" do
    FactoryGirl.build(:den, :den_number => @den.den_number).should_not be_valid
  end
end
