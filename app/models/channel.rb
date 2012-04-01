class Channel < ActiveRecord::Base
  # associations
  has_many :messages, dependent: :destroy
  
  # validations
  validates :name, presence: true, uniqueness: true
  
  def pub_sub_name
    "/channels/#{id}/messages/new"
  end
end
