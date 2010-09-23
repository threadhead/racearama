class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :layout
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      
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
end
