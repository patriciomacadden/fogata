class Upload < ActiveRecord::Base
  # associations
  belongs_to :user
  belongs_to :channel
  
  # callbacks
  after_create :create_upload_message
  
  # validations
  validates :upload, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :channel_id, presence: true
  
  # scopes
  scope :latest, order('created_at DESC').limit(5)
  
  # uploaders
  mount_uploader :upload, UploadUploader
  
  private
  
  def create_upload_message
    UploadMessage.create! channel_id: channel_id, user_id: user_id, upload_id: id
  end
end
