class Channel < ActiveRecord::Base
  extend FriendlyId
  
  # accessible attributes
  attr_accessible :current_topic, :name, :slug
  
  # friendly_id
  friendly_id :name, use: :slugged
  
  # validations
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
end
