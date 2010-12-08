class ScoutsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_event
  authorize_resource
  respond_to :html, :rjs
  
  def index
    # @scouts = Scout.all
    if params[:scout_search]
      @scouts = Scout.search_names(params[:scout_search])        
    else
      @scouts = Scout.includes(:den).sort_fl_name
    end
    @mode = params[:mode] || ""
  end
  
  def show
    @scout = Scout.find(params[:id])
    @current_event = Event.current_event
  end
  
  def new
    @scout = Scout.new
  end
  
  def create
    @scout = Scout.new(params[:scout])
    if @scout.save
      flash[:notice] = "Successfully created scout."
      redirect_to @scout
    else
      render :action => 'new'
    end
  end
  
  def edit
    @scout = Scout.find(params[:id])
  end
  
  def update
    @scout = Scout.find(params[:id])
    if @scout.update_attributes(params[:scout])
      flash[:notice] = "Successfully updated scout."
      redirect_to @scout
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @scout = Scout.find(params[:id])
    @scout.destroy
    flash[:notice] = "Successfully destroyed scout."
    redirect_to scouts_url
  end
  
  def check_in
    # @event = Event.current_event
    @scout = Scout.find(params[:id])
    # @scout.update_attribute(:checked_in, true)
    @scout.events << @event
    flash[:notice] = "#{@scout.full_name} was sucessfully checked in.<br />If you made a mistake, you can <a href=\"/scouts/#{@scout.id}/check_out\">check out #{@scout.first_name}</a> to undo.".html_safe
    redirect_to @scout
  end
  
  def check_out
    # @event = Event.current_event
    @scout = Scout.find(params[:id])
    # @scout.update_attribute(:checked_in, false)
    @scout.events.delete(@event)
    flash[:notice] = "#{@scout.full_name} was sucessfully checked out. He will no longer be included in race activities.".html_safe
    redirect_to @scout
  end
end
