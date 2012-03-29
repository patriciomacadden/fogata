class User < ActiveRecord::Base
  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  
  # accessible attributes
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation
  
  # secure password
  has_secure_password
  
  def to_s
    username
  end
end
