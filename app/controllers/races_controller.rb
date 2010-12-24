class RacesController < ApplicationController
  # before_filter :current_event
  
  def index
    @heat = Heat.find(params[:heat_id])
    @heat_group = @heat.heat_group
    @races = @heat.races
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def edit
    @race = Race.find(params[:id])
  end

  def create
    @heat = Heat.find(params[:heat_id])
    @heat.generate_races(params[:races_to_generate], params[:selected_lanes])
    
    @heat.update_attributes({:races_to_generate => params[:races_to_generate], :generate_method => params[:generate_method], :generate_time => Time.now })
    @lane_to_race = params[:selected_lanes]
    
    redirect_to heat_races_path
    # @race = Race.new(params[:race])
    # 
    # if @race.save
    #   redirect_to(@race, :notice => 'Race was successfully created.')
    # else
    #   render :action => "new"
    # end
  end

  # PUT /races/1
  # PUT /races/1.xml
  def update
    @race = Race.find(params[:id])

    respond_to do |format|
      if @race.update_attributes(params[:race])
        format.html { redirect_to(@race, :notice => 'Race was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.xml
  def destroy
    @race = Race.find(params[:id])
    @race.destroy

    respond_to do |format|
      format.html { redirect_to(races_url) }
      format.xml  { head :ok }
    end
  end
end
