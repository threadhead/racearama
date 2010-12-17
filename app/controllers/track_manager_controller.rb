class TrackManagerController < ApplicationController
  before_filter :store_params_and_authenticate
  # skip_before_filter :check_for_current_event, :only => [:index]
  
  def index
    session[:username] = nil
  end

  private
  def store_params_and_authenticate
    session[:username] = "track_manager" unless user_signed_in?
    authenticate_user!
  end

end
