class Channel < ActiveRecord::Base
  extend FriendlyId

  # accessible attributes
  attr_accessible :current_topic, :name, :slug

  # associations
  belongs_to :user
  has_many :current_topic_change_messages
  has_many :messages
  has_many :online_users, through: :onlines, source: :user
  has_many :onlines, dependent: :destroy
  has_many :text_messages

  # friendly_id
  friendly_id :name, use: :slugged

  # validations
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true
  validates :user_id, presence: true
end
