class HeatGroupsController < ApplicationController
  before_filter :current_event
  
  def index
    @heat_group = HeatGroup.new
    @heat_groups = @event.heat_groups.all
  end

  # def show
  #   @heat_group = HeatGroup.find(params[:id])
  # end

  # def new
  #   @heat_group = HeatGroup.new
  # end

  def edit
    @heat_group = HeatGroup.find(params[:id])
  end

  def create
    @heat_group = @event.build.heat_group(params["/race/heat_groups"])

    if @heat_group.save
      redirect_to(race_heat_groups_url, :notice => 'Heat group was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @heat_group = HeatGroup.find(params[:id])

    if @heat_group.update_attributes(params[:heat_group])
      redirect_to(@heat_group, :notice => 'Heat group was successfully updated.')
    else
      redirect_to race_heat_groups_url
    end
  end

  def destroy
    @heat_group = HeatGroup.find(params[:id])
    @heat_group.destroy

    redirect_to race_heat_groups_url
  end
end
