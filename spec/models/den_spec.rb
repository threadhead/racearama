require File.dirname(__FILE__) + '/../spec_helper'

describe Den do
  it "should be valid" do
    Den.new.should be_valid
  end
end
