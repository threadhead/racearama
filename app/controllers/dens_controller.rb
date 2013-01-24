class DensController < ApplicationController
  layout 'layouts/application_bootstrap'

  def index
    @dens = Den.joins(:pack).order('packs.name ASC, dens.den_number ASC')
  end

  def show
    @den = Den.find(params[:id])
  end

  def new
    @den = Den.new
  end

  def create
    @den = Den.new(params[:den])
    if @den.save
      flash[:notice] = "Successfully created den."
      redirect_to @den
    else
      render :action => 'new'
    end
  end

  def edit
    @den = Den.find(params[:id])
  end

  def update
    @den = Den.find(params[:id])
    if @den.update_attributes(params[:den])
      flash[:notice] = "Successfully updated den."
      redirect_to @den
    else
      render :action => 'edit'
    end
  end

  def destroy
    @den = Den.find(params[:id])
    @den.destroy
    flash[:notice] = "Successfully destroyed den."
    redirect_to dens_url
  end
end
