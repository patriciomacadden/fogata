class Channel < ActiveRecord::Base
  # associations
  belongs_to :user
  has_and_belongs_to_many :users, uniq: true
  has_many :messages, dependent: :destroy
  has_many :onlines, dependent: :destroy
  has_many :online_users, through: :onlines, source: :user
  has_many :uploads, dependent: :destroy
  
  # callbacks
  after_create :allow_creator
  
  # validations
  validates :name, presence: true, uniqueness: true
  
  def pub_sub_name
    "/channels/#{id}/messages/new"
  end
  
  def im_online_name
    "/channels/#{id}/im_online"
  end
  
  def change_topic(user, new_topic)
    update_attributes! current_topic: new_topic
    
    ChangeTopicMessage.create! user_id: user.id, text: current_topic, channel_id: id
  end
  
  private
  
  def allow_creator
    self.users << user
  end
end
