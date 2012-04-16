class Message < ActiveRecord::Base
  # associations
  belongs_to :channel
  belongs_to :upload
  belongs_to :user
  
  # validations
  validates :channel_id, presence: true
  validates :upload_id, presence: true, if: Proc.new { |message| message.type == 'UploadMessage' }
  validates :user_id, presence: true
  validates :text, presence: true, if: Proc.new { |message| message.type == 'TextMessage' }
end
