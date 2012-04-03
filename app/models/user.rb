class User < ActiveRecord::Base
  # associations
  has_and_belongs_to_many :channels, uniq: true
  has_many :channels
  has_many :messages
  
  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  
  # accessible attributes
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :locale, :timezone
  
  # secure password
  has_secure_password
  
  def to_s
    "#{first_name} #{last_name}"
  end
end
