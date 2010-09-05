require File.dirname(__FILE__) + '/../spec_helper'

describe Pack do
  it "should be valid" do
    Pack.new.should be_valid
  end
end
