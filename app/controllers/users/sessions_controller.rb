class Users::SessionsController < Devise::SessionsController
  skip_before_filter :check_for_current_event
  
  def new
    @username = session[:username] #if session.has_key?(:user_params)
  end
end