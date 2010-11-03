class TrackTestController < ApplicationController
  before_filter :set_status
  before_filter :get_controller_status, :except => [:test_lanes]
  
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
    do_test_race
    render :action => :index
  end
  
  def test_lanes
    lane_status
    respond_to do |format|
      format.html { 
        get_controller_status
        render :action => :index
        }
      format.js  { render 'test_lanes' }
    end
    
  end



  private
  def do_test_race
    @return = DaqController.send("start_race".to_sym, @setting.opts)
    @race_results = @return[:result][:results]
  end
  
  def lane_status
    @return = DaqController.send("test_lanes".to_sym, @setting.opts)
    @lane_status = @return[:result]#[:lane_status]
  end
  
  def gate_test(direction)
    @gate_status = DaqController.send("starting_gate_#{direction}".to_sym, @setting.opts)
    
    if @gate_status[:result]['status'] == "ok"
      flash[:msg_ok] = "Gate #{direction.upcase} command was sent and received without error."
    else
      flash[:error] = "Gate #{direction.upcase} command was sent, but an error occurred: #{@gate_status[:error]}"
    end
  end
  
  def set_status
    @setting = Setting.first
  end
  
  def get_controller_status
    @daq_status = DaqController.status(@setting.opts)
    if @daq_status.has_key?(:error)
      flash[:error] = "Can not communicate with DAQ Controller service (#{@daq_status[:error]}). Verify that the DAQ Controller host/port/api_key are set properly!"
    end
  end
end
