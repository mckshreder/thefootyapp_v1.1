class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  helper_method :current_user
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    
  end

  def authorize
    unless current_user
        flash["alert-warning"] = "You must be logged in to use FOOTY"
        redirect_to new_user_path
    end
  end 
end