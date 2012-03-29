class Message < ActiveRecord::Base
  # associations
  belongs_to :channel
  belongs_to :user
  
  # validations
  validates :text, presence: true
  validates :channel_id, presence: true
  validates :user_id, presence: true
end
