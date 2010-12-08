class CheckInController < ApplicationController
  # session[:user_params] = params
  # before_filter :authenticate_user!
  before_filter :store_params_and_authenticate
  
  def index
    session[:username] = nil
    @scout_search = params[:scout_search] || ""
    @mode = "check_in"
    authorize! :read, Scout
    @scouts = Scout.includes(:den).sort_fl_name
  end
  
  private
  def store_params_and_authenticate
    session[:username] = "check_in" unless user_signed_in?
    authenticate_user!
  end
  
end
