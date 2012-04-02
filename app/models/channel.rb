class Channel < ActiveRecord::Base
  # associations
  has_many :messages, dependent: :destroy
  
  # validations
  validates :name, presence: true, uniqueness: true
  
  def pub_sub_name
    "/channels/#{id}/messages/new"
  end
  
  def change_topic(user, new_topic)
    update_attributes! current_topic: new_topic
    
    ChangeTopicMessage.create! user_id: user.id, text: current_topic, channel_id: id
  end
end
