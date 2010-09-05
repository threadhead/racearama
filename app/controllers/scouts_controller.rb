class ScoutsController < ApplicationController
  def index
    @scouts = Scout.all
  end
  
  def show
    @scout = Scout.find(params[:id])
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
end
