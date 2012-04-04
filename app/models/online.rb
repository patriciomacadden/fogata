class Online < ActiveRecord::Base
  # associations
  belongs_to :channel
  belongs_to :user
  
  # validations
  validates :channel_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :channel_id }
end
