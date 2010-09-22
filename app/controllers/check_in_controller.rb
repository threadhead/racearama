class CheckInController < ApplicationController
  # session[:user_params] = params
  # before_filter :authenticate_user!
  before_filter :store_params_and_authenticate
  
  def index
    session[:user_params] = nil
    authorize! :read, Scout

    if params[:scout_search]
      like_param = "%" + params[:scout_search] + "%"
      @scouts = Scout.where(
        "first_name LIKE ? OR last_name LIKE ?", like_param, like_param).includes(:den)
        
    else
      @scouts = Scout.includes(:den)
    end
  end
  
  private
  def store_params_and_authenticate
    session[:user_params] = params if params
    authenticate_user!
  end
  
end
