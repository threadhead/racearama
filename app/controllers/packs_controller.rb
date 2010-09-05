class PacksController < ApplicationController
  def index
    @packs = Pack.all
  end
  
  def show
    @pack = Pack.find(params[:id])
  end
  
  def new
    @pack = Pack.new
  end
  
  def create
    @pack = Pack.new(params[:pack])
    if @pack.save
      flash[:notice] = "Successfully created pack."
      redirect_to @pack
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pack = Pack.find(params[:id])
  end
  
  def update
    @pack = Pack.find(params[:id])
    if @pack.update_attributes(params[:pack])
      flash[:notice] = "Successfully updated pack."
      redirect_to @pack
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pack = Pack.find(params[:id])
    @pack.destroy
    flash[:notice] = "Successfully destroyed pack."
    redirect_to packs_url
  end
end
