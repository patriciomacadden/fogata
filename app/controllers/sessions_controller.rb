class SessionsController < ApplicationController
  def create
    auth = env['omniauth.auth']
    user = User.find_or_create_by_provider_and_uid!(auth['provider'], auth['uid'])
    session[:user_id] = user.id
    redirect_to root_url, notice: t('controllers.sessions.successfully_signed_in')
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('controllers.sessions.successfully_signed_in')
  end
end
