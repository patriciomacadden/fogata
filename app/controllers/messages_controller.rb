class MessagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_channel
  
  # POST /channels/:channel_id/messages
  def create
    @message = @channel.messages.build(params[:message])
    @message.user_id = current_user.id
    @message.save!
  end
  
  private
  
  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
