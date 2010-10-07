require 'spec_helper'

describe "DAQ Controller" do
  before(:each) do
    # @daq = DaqController
    @opts = { :apikey => "development", :host => "localhost", :port => "8011" }
  end
  
  describe "GET /verify" do
    it "should return 200-OK and api_key_valid is true" do
      reply = DaqController.verify_apikey(@opts)
      reply[:result]['api_key_valid'].should be_true
      reply[:response].should be_kind_of(Net::HTTPOK)
    end
    
    it "should return 403 error if api key is invalid" do
      opts = @opts.merge(:apikey => "lolkatz")
      DaqController.verify_apikey(opts)[:response].should be_kind_of(Net::HTTPForbidden)
    end
  end
  
  describe "GET /status" do
    it "should return a status of active" do
      DaqController.status(@opts)[:result]['status'].should eql("active")
    end
  end
  
  describe "POST /starting_gate_down" do
    it "should return a gate down reply" do
      DaqController.starting_gate_down(@opts)[:result]['gate'].should eql("down")
    end
  end

  describe "POST /starting_gate_up" do
    it "should return a gate up reply" do
      DaqController.starting_gate_up(@opts)[:result]['gate'].should eql("up")
    end
  end
  
  describe "POST /starting_gate_status" do
    it "should return a gate down reply when first set to down" do
      DaqController.starting_gate_down(@opts)
      DaqController.starting_gate_status(@opts)[:result]['gate'].should eql("down")
    end
    
    it "should return a gate up reply when first set to up" do
      DaqController.starting_gate_up(@opts)
      DaqController.starting_gate_status(@opts)[:result]['gate'].should eql("up")
    end
  end
  
  describe "POST /start_race" do
    it "should return a hash of race results" do
      reply = DaqController.start_race(@opts)
      reply[:result]['status'].should eql("OK")
      reply[:result]['units'].should eql("miliseconds")
      reply[:result]['results'].each_with_index do |r, idx|
        r['lane'].should eql(idx+1)
        r['time'].should be_close(Time.new.to_i/1000, 10)
      end      
    end
  end
end