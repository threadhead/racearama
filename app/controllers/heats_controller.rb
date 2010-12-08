class HeatsController < ApplicationController
  before_filter :current_event
  
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
    @scouts_not_in_heat = current_event.scouts.includes(:den => :pack) - @heat.scouts
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
    @heat = Heat.find(params[:heat_id])
    @scout = Scout.find(params[:scout_id])
    unless @heat.scouts.exists?(@scout)
      @heat.scouts << @scout
    end
    @heat_group = @heat.heat_group
    
    redirect_to edit_race_heat_group_heat_url(@heat_group, @heat)
  end
end
