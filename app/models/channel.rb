class Channel < ActiveRecord::Base
  # validations
  validates :name, presence: true, uniqueness: true
end
