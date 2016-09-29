class User < ActiveRecord::Base
  has_many :providers
  has_many :parents
  has_secure_password
  validates_presence_of :username, :password, :email
  def authenticate
  end
end