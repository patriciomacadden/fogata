class UploadsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_channel
  
  # POST /channels/:channel_id/uploads
  def create
    @upload = @channel.uploads.build(params[:upload])
    @upload.user_id = current_user.id
    
    if @upload.valid?
      @upload.save!
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  #def destroy
  #  @upload = Upload.find(params[:id])
  #  @upload.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to uploads_url }
  #    format.json { head :no_content }
  #  end
  #end
  
  private
  
  def find_channel
    @channel = Channel.find(params[:channel_id])
  end
end
