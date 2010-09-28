class EventsController < ApplicationController
  before_filter :authenticate_user!
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
      redirect_to @event, :notice => 'Event was successfully updated.'
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
end
