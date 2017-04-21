class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
helper_method :current_user
end
private
def current_user
# if current_user is nil then set it if the session exists
@current_user ||= User.find(session[:user_id]) if session[:user_id]
end