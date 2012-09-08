class User < ActiveRecord::Base
  # accessible attributes
  attr_accessible :provider, :uid

  # associations
  has_many :channels

  # validations
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
end
