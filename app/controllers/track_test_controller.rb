class TrackTestController < ApplicationController
  respond_to :html, :rjs
  before_filter :get_controller_status #, :except => [:test_lanes, :test_race]
  
  def index
  end

  def gate_down
    gate_test("down")
  end
  
  def gate_up
    gate_test("up")
  end
  
  def test_race
    @race_results = RaceCom.do_test_race(@race_duration.to_i)
    sleep(4)
  end
  
  def test_lanes
    @lane_status = RaceCom.lane_status
  end



  private
  def get_controller_status
    @setting = RaceCom.get_settings
    @race_duration = params["slider-amount"] || "10"
    @daq_status = RaceCom.get_controller_status
    if @daq_status.has_key?(:error)
      flash[:error] = "Can not communicate with DAQ Controller service (#{@daq_status[:error]}). Verify that the DAQ Controller host/port/api_key are set properly!"
    end    
  end


  def gate_test(direction)
    @gate_status = RaceCom.gate_test(direction)
    
    if @gate_status[:result]['status'] == "ok"
      flash[:msg_ok] = "Gate #{direction.upcase} command was sent and received without error."
    else
      flash[:error] = "Gate #{direction.upcase} command was sent, but an error occurred: #{@gate_status[:error]}"
    end
  end

end
