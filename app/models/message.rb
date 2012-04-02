class Message < ActiveRecord::Base
  # associations
  belongs_to :channel
  belongs_to :user
  
  # validations
  validates :text, presence: true, if: Proc.new { |message| message.type == 'TextMessage' }
  validates :channel_id, presence: true
  validates :user_id, presence: true
end
