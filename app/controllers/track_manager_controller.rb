class TrackManagerController < ApplicationController
  before_filter :store_params_and_authenticate
    
  def index
    session[:username] = nil
  end

  private
  def store_params_and_authenticate
    session[:username] = "track_manager"
    authenticate_user!
  end

end
