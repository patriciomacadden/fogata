class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def authenticate_user!
    if current_user.nil?
      redirect_to '/auth/google_oauth2'
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def user_signed_in?
    !@current_user.nil?
  end
  helper_method :user_signed_in?
end
