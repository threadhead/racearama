class Users::SessionsController < Devise::SessionsController
  def new
    @username = session[:user_params][:username] #if session.has_key?(:user_params)
    puts "username: #{params[:username]}"
  end
end