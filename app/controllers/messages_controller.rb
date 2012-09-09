class MessagesController < ApplicationController
  before_filter :find_channel!
  respond_to :html, :js, :json
  
  # POST /channels/channel-1/messages
  # POST /channels/channel-1/messages.json
  def create
    @message = @channel.text_messages.new(params[:message])
    @message.user = current_user
    @message.save!
    respond_with @message, location: @channel
  end

  private

  def find_channel!
    @channel = Channel.find(params[:channel_id])
  end
end
