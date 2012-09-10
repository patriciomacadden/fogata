class ChannelsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :json
  
  # GET /channels
  # GET /channels.json
  def index
    @channels = ChannelDecorator.all

    respond_with @channels
  end

  # GET /channels/channel-1
  # GET /channels/channel-1.json
  def show
    @channel = ChannelDecorator.find(params[:id])
    @message = Message.new

    respond_with @channel
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
    @channel = Channel.new

    respond_with @channel
  end

  # GET /channels/channel-1/edit
  def edit
    @channel = Channel.find(params[:id])

    respond_with @channel
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(params[:channel])
    @channel.user = current_user
    flash[:notice] = t('controllers.channels.channel_was_successfully_created') if @channel.save

    respond_with @channel
  end

  # PUT /channels/channel-1
  # PUT /channels/channel-1.json
  def update
    @channel = Channel.find(params[:id])
    flash[:notice] = t('controllers.channels.channel_was_successfully_updated') if @channel.update_attributes(params[:channel])

    respond_with @channel
  end

  # DELETE /channels/channel-1
  # DELETE /channels/channel-1.json
  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy

    respond_with @channel
  end

  # PUT /channels/channel-1/change_current_topic
  # PUT /channels/channel-1/change_current_topic.json
  def change_current_topic
    @channel = ChannelDecorator.find(params[:id])
    @channel.update_attributes(params[:channel])
    @message = @channel.current_topic_change_messages.create text: @channel.current_topic, user: current_user
    @message = MessageDecorator.decorate @message

    respond_with @channel
  end
end
