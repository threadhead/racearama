class HeatsController < ApplicationController
  # before_filter :current_event
  respond_to :html, :js
  
  
  def index
    @heat_group = HeatGroup.find(params[:heat_group_id])
    @heats = @heat_group.heats
    @heat = Heat.new
  end


  def show
    @heat = Heat.find(params[:id])
  end


  def new
    @heat = Heat.new
  end


  def edit
    @heat_group = HeatGroup.find(params[:heat_group_id])
    @heat = Heat.find(params[:id])
    @scouts_not_in_heat = @event.scouts.sort_fl_name - @heat.scouts
    if @heat.scouts.count > @event.track.active_lanes_count
      flash[:error] = "ATTENTION: there are more scouts in this heat than available lanes on the track. You need to remove some scouts before you can generate the races."
    end
  end


  def create
    @heat_group = HeatGroup.find(params[:heat_group_id])
    @heat = @heat_group.heats.build(params[:heat])

      if @heat.save
        redirect_to race_heat_group_heats_url(@heat.heat_group), :notice => 'Heat was successfully created.'
      else
        @heats = @heat_group.reload.heats
        render :action => "index"
      end
  end

  def update
    @heat = Heat.find(params[:id])

    if @heat.update_attributes(params[:heat])
      redirect_to(@heat, :notice => 'Heat was successfully updated.')
    else
      render :action => "edit"
    end
  end


  def destroy
    heat_group = HeatGroup.find(params[:heat_group_id])
    @heat = Heat.find(params[:id])
    @heat.destroy

    redirect_to race_heat_group_heats_url(heat_group)
  end
  
  
  def remove_scout
    @heat = Heat.find(params[:heat_id])
    @scout = Scout.find(params[:scout_id])
    @heat.scouts.delete @scout
    @heat_group = @heat.heat_group
    
    redirect_to edit_race_heat_group_heat_url(@heat_group, @heat)
  end
  
  
  def add_scout
    @mode = "heats"
    @heat = Heat.find(params[:heat_id])
    if params[:scout_id] == "0"
      @heat.add_scout_by_ids(params[:scout_ids])
    else
      @scout = Scout.find(params[:scout_id])
      @heat.add_scout(@scout)
    end
    @heat_group = @heat.heat_group
    # @scouts = Scout.search_names(params[:scout_search], @event)        
    
    respond_with do |format|
      format.html { redirect_to edit_race_heat_group_heat_url(@heat_group, @heat) }
      format.js  { render :action => 'add_scout' }
    end
  end
  
  
  def race
    @heat = Heat.find(params[:id])
    if @heat.has_current_race?
      
    end
  end
end
