class RaceController < ApplicationController
  before_filter :current_event
  
  def heat_group
    @heat_group = HeatGroup.new
    @heat_groups = @event.heat_groups
  end
  
  def heat_group_create
    @heat_group = HeatGroup.new(params[:heat_group])

    if @heat_group.save
      redirect_to(race_heat_group_path, :notice => 'Heat group was successfully created.') }
    else
      render :action => "new" }
    end
    
  end

  def heat
  end

  def assign_lanes
  end

  def do_race
  end
end
