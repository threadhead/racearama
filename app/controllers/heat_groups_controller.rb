class HeatGroupsController < ApplicationController
  # GET /heat_groups
  # GET /heat_groups.xml
  def index
    @heat_groups = HeatGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heat_groups }
    end
  end

  # GET /heat_groups/1
  # GET /heat_groups/1.xml
  def show
    @heat_group = HeatGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heat_group }
    end
  end

  # GET /heat_groups/new
  # GET /heat_groups/new.xml
  def new
    @heat_group = HeatGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heat_group }
    end
  end

  # GET /heat_groups/1/edit
  def edit
    @heat_group = HeatGroup.find(params[:id])
  end

  # POST /heat_groups
  # POST /heat_groups.xml
  def create
    @heat_group = HeatGroup.new(params[:heat_group])

    respond_to do |format|
      if @heat_group.save
        format.html { redirect_to(@heat_group, :notice => 'Heat group was successfully created.') }
        format.xml  { render :xml => @heat_group, :status => :created, :location => @heat_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heat_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heat_groups/1
  # PUT /heat_groups/1.xml
  def update
    @heat_group = HeatGroup.find(params[:id])

    respond_to do |format|
      if @heat_group.update_attributes(params[:heat_group])
        format.html { redirect_to(@heat_group, :notice => 'Heat group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heat_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heat_groups/1
  # DELETE /heat_groups/1.xml
  def destroy
    @heat_group = HeatGroup.find(params[:id])
    @heat_group.destroy

    respond_to do |format|
      format.html { redirect_to(heat_groups_url) }
      format.xml  { head :ok }
    end
  end
end
