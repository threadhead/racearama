class CheckInController < ApplicationController
  # session[:user_params] = params
  # before_filter :authenticate_user!
  before_filter :store_params_and_authenticate
  
  def index
    session[:username] = nil
    @scout_search = params[:scout_search] || ""
    authorize! :read, Scout

    if params[:scout_search]
      like_param = "%" + params[:scout_search] + "%"
      @scouts = Scout.where(
        "first_name LIKE ? OR last_name LIKE ?", like_param, like_param).includes(:den).sort_fl_name
        
    else
      @scouts = Scout.includes(:den).sort_fl_name
    end
    
  end
  
  private
  def store_params_and_authenticate
    session[:username] = "check_in" unless user_signed_in?
    authenticate_user!
  end
  
end
