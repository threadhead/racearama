class RacesController < ApplicationController
  # before_filter :current_event
  
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
  
  def destroy_races
    @heat = Heat.find(params[:heat_id])
    @heat.races.each{ |race| race.destroy }
    redirect_to heat_races_path
  end
  
  
  def stage
    if request.post?
      @race = Race.find(params[:id])
      @race.update_attribute(:current, true)
    end
  end
  
  
  def complete
    if request.post?
      @race = Race.find(params[:id])
      @race.update_attribute(:completed, true)
    end
  end
end
