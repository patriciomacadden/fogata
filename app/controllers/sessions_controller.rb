class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:user][:username])
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: I18n.t('controllers.sessions.successfully_signed_in')
    else
      flash.now.alert = 'Invalid username or password'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: I18n.t('controllers.sessions.successfully_signed_out')
  end
end
