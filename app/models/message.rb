class Message < ActiveRecord::Base
  # accessible attributes
  attr_accessible :text, :user

  # associations
  belongs_to :channel
  belongs_to :user

  # validations
  validates :channel_id, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  
  def to_partial_path
    "messages/#{type.underscore}"
  end
end
