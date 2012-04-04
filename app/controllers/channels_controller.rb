class ChannelsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
    
    @channels.each do |channel|
      # delete all online users from the last 5 seconds
      channel.onlines.where('created_at <= ? OR user_id = ?', 5.seconds.ago, current_user.id).delete_all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel = Channel.find(params[:id])
    authorize! :read, @channel
    
    # delete all online users from the last 5 seconds
    @channel.onlines.where('created_at <= ? OR user_id = ?', 5.seconds.ago, current_user.id).delete_all
    
    # add the current_user
    @channel.online_users << current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
    @channel = Channel.new
    @channel.users << current_user
    authorize! :create, @channel

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/1/edit
  def edit
    @channel = Channel.find(params[:id])
    authorize! :update, @channel
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(params[:channel])
    @channel.user = current_user
    authorize! :create, @channel

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: I18n.t('controllers.channels.channel_was_successfully_created') }
        format.json { render json: @channel, status: :created, location: @channel }
      else
        format.html { render action: "new" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1
  # PUT /channels/1.json
  def update
    @channel = Channel.find(params[:id])
    authorize! :update, @channel

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to @channel, notice: I18n.t('controllers.channels.channel_was_successfully_updated') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel = Channel.find(params[:id])
    authorize! :destroy, @channel
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end
  
  # PUT /channels/1/change_topic
  def change_topic
    @channel = Channel.find params[:id]
    authorize! :update, @channel
    
    @channel.change_topic current_user, params[:channel][:current_topic]
  end
  
  # PUT /channels/1/im_online
  def im_online
    @channel = Channel.find params[:id]
    
    # delete all online users from the last 5 seconds
    @channel.onlines.where('created_at <= ? OR user_id = ?', 5.seconds.ago, current_user.id).delete_all
    
    # add the current_user
    @channel.online_users << current_user
  end
end
