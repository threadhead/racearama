class CheckInController < ApplicationController
  def index
    if params[:scout_search]
      @scouts = Scout.find(:all,
        :conditions => ["first_name LIKE ? OR last_name LIKE ?",
          "%"+params[:scout_search]+"%", "%"+params[:scout_search]+"%"],
        :include => :den)
    else
      @scouts = Scout.all
    end
  end
  
end
