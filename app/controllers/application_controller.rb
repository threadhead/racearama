class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  before_filter :check_for_current_event, :except => [:sign_in, :sign_out]
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      # if Event.current_event
      
        if resource_or_scope.role? :check_in
          check_in_url
        
        elsif resource_or_scope.role? :track_manager
          track_manger_url
        
        elsif resource_or_scope.role? :car_staging
          staging_url
        end
    else
      super
    end
  end


  # def current_event
  #   Event.current_event
  # end
  

  def check_for_current_event
    @event = Event.current_event

    if @event.blank?
      if current_user && current_user.role?(:track_manager)
        flash[:alert] = "There is NO active Event. Please correct this immediately!"
      else
        redirect_to page_event_not_set_path and return
      end
    end
  end
  
end
