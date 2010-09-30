class LaneAssignmentsController < ApplicationController
  # GET /lane_assignments
  # GET /lane_assignments.xml
  def index
    @lane_assignments = LaneAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lane_assignments }
    end
  end

  # GET /lane_assignments/1
  # GET /lane_assignments/1.xml
  def show
    @lane_assignment = LaneAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lane_assignment }
    end
  end

  # GET /lane_assignments/new
  # GET /lane_assignments/new.xml
  def new
    @lane_assignment = LaneAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lane_assignment }
    end
  end

  # GET /lane_assignments/1/edit
  def edit
    @lane_assignment = LaneAssignment.find(params[:id])
  end

  # POST /lane_assignments
  # POST /lane_assignments.xml
  def create
    @lane_assignment = LaneAssignment.new(params[:lane_assignment])

    respond_to do |format|
      if @lane_assignment.save
        format.html { redirect_to(@lane_assignment, :notice => 'Lane assignment was successfully created.') }
        format.xml  { render :xml => @lane_assignment, :status => :created, :location => @lane_assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lane_assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lane_assignments/1
  # PUT /lane_assignments/1.xml
  def update
    @lane_assignment = LaneAssignment.find(params[:id])

    respond_to do |format|
      if @lane_assignment.update_attributes(params[:lane_assignment])
        format.html { redirect_to(@lane_assignment, :notice => 'Lane assignment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lane_assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lane_assignments/1
  # DELETE /lane_assignments/1.xml
  def destroy
    @lane_assignment = LaneAssignment.find(params[:id])
    @lane_assignment.destroy

    respond_to do |format|
      format.html { redirect_to(lane_assignments_url) }
      format.xml  { head :ok }
    end
  end
end
