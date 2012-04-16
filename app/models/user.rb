class User < ActiveRecord::Base
  # associations
  has_and_belongs_to_many :channels, uniq: true
  has_many :messages
  has_many :onlines
  has_many :online_channels, through: :onlines, source: :channel
  has_many :uploads
  
  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :locale, presence: true
  validates :timezone, presence: true
  
  # accessible attributes
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :locale, :timezone, :admin
  
  # secure password
  has_secure_password
  
  def to_s
    "#{first_name} #{last_name.first}."
  end
end
