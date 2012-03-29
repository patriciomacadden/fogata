class Channel < ActiveRecord::Base
  # associations
  has_many :messages
  
  # validations
  validates :name, presence: true, uniqueness: true
end
