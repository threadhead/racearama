class TrackTestController < ApplicationController
  respond_to :html, :rjs
  before_filter :get_controller_status #, :except => [:test_lanes, :test_race]
  layout 'layouts/application_bootstrap'

  def index
  end

  def gate_down
    gate_test("down")
  end

  def gate_up
    gate_test("up")
  end

  def test_race
    @race_results = RaceCom.do_race(@track, @race_duration.to_i)
    sleep(4)
  end

  def test_lanes
    @lane_status = RaceCom.lane_status(@track)
  end

  def set_current_track
    if params[:current_track]
      session[:track_id] = params[:current_track]
      @track = Track.find(session[:track_id])
      flash[:notice] = "You are now controlling the #{@track.name_pack_lanes} track"
    else
      flash[:error] = "The selected track was not found, defaulting to the first availalbe track"
    end
    redirect_to track_test_path
  end



  private
  def get_controller_status
    @track = Track.find_by_id(session[:track_id]) || Track.first
    @race_duration = params["slider-amount"] || "10"
    @daq_status = RaceCom.get_controller_status(@track)
    if @daq_status.has_key?(:error)
      flash[:error] = "Can not communicate with DAQ Controller service (#{@daq_status[:error]}). Verify that the DAQ Controller host/port/api_key are set properly!"
    end
  end


  def gate_test(direction)
    @gate_status = RaceCom.gate_test(@track, direction)

    if @gate_status[:result]['status'] == "ok"
      flash[:msg_ok] = "Gate #{direction.upcase} command was sent and received without error."
    else
      flash[:error] = "Gate #{direction.upcase} command was sent, but an error occurred: #{@gate_status[:error]}"
    end
  end

end
