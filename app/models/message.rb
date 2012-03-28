class Message < ActiveRecord::Base
  # associations
  belongs_to :user
  
  # validations
  validates :text, presence: true
  validates :user_id, presence: true
end
