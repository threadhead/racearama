require 'spec_helper'

describe PageController do

  describe "GET 'welcome'" do
    it "should be successful" do
      get 'welcome'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'copyright'" do
    it "should be successful" do
      get 'copyright'
      response.should be_success
    end
  end

end
