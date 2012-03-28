class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_username(params[:user][:username])
    
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Successfully signed in.'
    else
      flash.now.alert = 'Invalid username or password'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully signed out.'
  end
end
