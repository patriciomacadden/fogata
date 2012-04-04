class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale_and_timezone
  
  helper_method :current_user
  helper_method :user_signed_in?

  rescue_from CanCan::AccessDenied do |exception|
    head :not_found
  end
  
  def authenticate_user!
    redirect_to sign_in_url unless current_user
  end
  
  private
  
  def set_locale_and_timezone
    I18n.locale = current_user.locale if current_user && current_user.locale.present?
    Time.zone = current_user.timezone if current_user && current_user.timezone.present?
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_signed_in?
    !!current_user
  end
end
