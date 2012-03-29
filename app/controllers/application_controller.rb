class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :user_signed_in?
  
  def authenticate_user!
    redirect_to sign_in_url unless current_user
  end
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_signed_in?
    !!current_user
  end
end
