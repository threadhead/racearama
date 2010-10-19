class TrackTestController < ApplicationController
  before_filter :get_controller_status
  def index
  end


  private
  def get_controller_status
    settings = Setting.first
    @daq_options = {:host => settings.daq_controller_host, :port => settings.daq_controller_port}
    @daq_status = DaqController.status(@daq_options)
  end
end
