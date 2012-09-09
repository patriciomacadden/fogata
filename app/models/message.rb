class Message < ActiveRecord::Base
  # accessible attributes
  attr_accessible :text

  # associations
  belongs_to :channel
  belongs_to :user

  # validations
  validates :channel_id, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
end
