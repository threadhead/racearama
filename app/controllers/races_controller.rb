class RacesController < ApplicationController
  # before_filter :current_event
  before_filter :get_settings
  before_filter :get_controller_status, :only => [:index, :create]
  
  def index
    @heat = Heat.find(params[:heat_id])
    @heat_group = @heat.heat_group
    @races = @heat.races
  end

  # def show
  #   @race = Race.find(params[:id])
  # end

  # def new
  #   @race = Race.new
  # end

  # def edit
  #   @race = Race.find(params[:id])
  # end

  def create
    @heat = Heat.find(params[:heat_id])
    @heat.generate_races(params[:races_to_generate], params[:selected_lanes])
    
    @heat.update_attributes({:races_to_generate => params[:races_to_generate], :generate_method => params[:generate_method], :generate_time => Time.now })
    # @lane_to_race = params[:selected_lanes]
    
    redirect_to heat_races_path
  end

  # def update
  #   @race = Race.find(params[:id])
  # 
  #   if @race.update_attributes(params[:race])
  #     redirect_to(@race, :notice => 'Race was successfully updated.')
  #   else
  #     render :action => "edit"
  #   end
  # end

  # def destroy
  #   @race = Race.find(params[:id])
  #   @race.destroy
  #   redirect_to(races_url)
  # end
  
  
  def run
    @race = Race.find(params[:id])
    run_race(@race_duration.to_i)
    sleep(4)
  end
  
  
  def destroy_races
    @heat = Heat.find(params[:heat_id])
    @heat.races.each{ |race| race.destroy }
    redirect_to heat_races_path
  end
  
  
  def stage
    if request.post?
      @race = Race.find(params[:id])
      @race.update_attribute(:current, true)
      redirect_to params[:redirect_to]
    end
  end
  
  
  def complete
    if request.post?
      @race = Race.find(params[:id])
      @race.update_attribute(:completed, true)
      redirect_to params[:redirect_to]
    end
  end
  
  
  
  private
  def run_race(duration)
    @return = DaqController.send("start_race".to_sym, @setting.opts, duration)
    @race_results = @return[:result]#[:results]
  end
  
  
  def get_settings
    @setting = Setting.first
    @race_duration = params["slider-amount"] || "10"
  end
  
  
  def get_controller_status
    @daq_status = DaqController.status(@setting.opts)
    if @daq_status.has_key?(:error)
      flash[:error] = "Can not communicate with DAQ Controller service (#{@daq_status[:error]}). Verify that the DAQ Controller host/port/api_key are set properly!"
    end
  end
end
