class CheckInController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    authorize! :read, Scout

    if params[:scout_search]
      like_param = "%" + params[:scout_search] + "%"
      @scouts = Scout.where(
        "first_name LIKE ? OR last_name LIKE ?", like_param, like_param).includes(:den)
        
    else
      @scouts = Scout.includes(:den)
    end
    
  end
  
end
