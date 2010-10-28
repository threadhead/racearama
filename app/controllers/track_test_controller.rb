class TrackTestController < ApplicationController
  before_filter :get_controller_status
  def index
  end

  def gate_down
    gate_test("down")
    render :action => :index    
  end
  
  def gate_up
    gate_test("up")
    render :action => :index    
  end
  
  def test_race
    
  end



  private
  def gate_test(direction)
    @gate_status = DaqController.send("starting_gate_#{direction}".to_sym, @setting.opts)
    
    if @gate_status[:result]['status'] == "ok"
      flash[:msg_ok] = "Gate #{direction.upcase} command was sent and received without error."
    else
      flash[:error] = "Gate #{direction.upcase} command was sent, but an error occurred: #{@gate_status[:error]}"
    end
  end
  
  
  def get_controller_status
    @setting = Setting.first
    
    @daq_status = DaqController.status(@setting.opts)
    if @daq_status.has_key?(:error)
      flash[:error] = "Can not communicate with DAQ Controller service (#{@daq_status[:error]}). Verify that the DAQ Controller host/port/api_key are set properly!"
    end
  end
end
