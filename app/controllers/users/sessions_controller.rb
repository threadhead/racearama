class Users::SessionsController < Devise::SessionsController
  def new
    @username = session[:username] #if session.has_key?(:user_params)
  end
end