class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  before_filter :check_for_current_event, :except => [:event_not_set, :welcome]
  
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
      # else
      #   page_event_not_set_url
      # end
    else
      super
    end
  end
  
  private
  def check_for_current_event
    if Event.current_event.nil?
      redirect_to page_event_not_set_path and return
    end
  end
end
