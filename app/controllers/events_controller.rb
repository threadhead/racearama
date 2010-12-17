class EventsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :check_for_current_event

  authorize_resource
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      redirect_to @event, :notice => 'Event was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      redirect_to events_path, :notice => 'Event was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to(events_url)
    
  rescue ActiveRecord::ActiveRecordError
    redirect_to @event, :alert => "Events with races or scouts can not be deleted!"
  end
  
  def set_active
    @event = Event.find(params[:id])
    Event.all.each{ |event| event.update_attributes({:active => false}) }
    @event.update_attributes({:active => true})
    redirect_to events_url, :notice => "#{@event.name} event was set as the active event (race)"
  end
end
