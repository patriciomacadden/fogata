class User < ActiveRecord::Base
  # accessible attributes
  attr_accessible :email, :first_name, :last_name, :provider, :uid

  # associations
  has_many :channels
  has_many :messages

  # validations
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :provider, presence: true
  validates :uid, presence: true, uniqueness: true
  
  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid']) || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.email = auth['info']['email']
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.provider = auth['provider']
      user.uid = auth['uid']
    end
  end
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
