class Online < ActiveRecord::Base
  # accessible attributes
  attr_accessible :channel_id, :user_id
  
  # associations
  belongs_to :channel
  belongs_to :user
  
  # validations
  validates :channel_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :channel_id }
end
